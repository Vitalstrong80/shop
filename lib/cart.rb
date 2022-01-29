class Cart
  def initialize(products = [])
    @products = products
  end

  def <<(product)
    @products << product
  end

  def total
    @products.sum(&:price)
  end

  def to_s
    @products
      .tally
      .map
      .with_index(1) { |(product, amount), index| "#{index}.#{product.to_s_for_cart} X #{amount} шт. = #{amount * product.price} руб." }.join("\n")
  end
end
