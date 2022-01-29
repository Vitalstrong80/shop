if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"
require_relative "lib/disc"
require_relative "lib/cart"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + "/data")

collection.sort!(by: :price, order: :asc)

cart = Cart.new

loop do
    system "clear"
  collection.remove_out_of_stock!

  puts <<~COLLECTION
  
    Что хотите купить?

    #{collection}

    0. Выход
  COLLECTION

  print ">"

  user_input = STDIN.gets.to_i

  break if user_input == 0

  chosen_product = collection[user_input]

  next if chosen_product.nil?

  cart << chosen_product
  chosen_product.amount -= 1

  puts <<~PRE_TOTAL
    Вы выбрали #{chosen_product}

    Всего товаров на сумму: #{cart.total}

  PRE_TOTAL
end

puts <<~TOTAL
  Вы купили:

  #{cart}
  
  С Вас - #{cart.total} руб. Спасибо за покупки!
TOTAL
