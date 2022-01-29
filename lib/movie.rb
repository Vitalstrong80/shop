class Movie < Product
  attr_accessor :name, :year, :director

  def initialize(params)
    super

    @name = params[:name]
    @year = params[:year]
    @director = params[:director]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: "UTF-8").map { |l| l.chomp }

    self.new(
      name: lines[0],
      director: lines[1],
      year: lines[2],
      price: lines[3],
      amount: lines[4]
    )
  end

  def to_s
    "Фильм <<#{@name}>>, #{@year}, реж. #{@director}, #{super}"
  end

  def to_s_for_cart
    "Фильм <<#{@name}>>, #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @name = params[:name] if params[:name]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
