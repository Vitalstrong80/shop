class Disc < Product
  attr_accessor :name, :artist, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: "UTF-8").map { |l| l.chomp }

    self.new(
      name: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end

  def initialize(params)
    super

    @name = params[:name]
    @genre = params[:genre]
    @year = params[:year]
    @artist = params[:artist]
  end

  def to_s
    "Альбом #{@artist} - #{@name}, #{@genre}, #{@year}, #{super}"
  end

  def to_s_for_cart
    "Альбом #{@artist} - #{@name}, #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @name = params[:name] if params[:name]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
    @artist = params[:artist] if params[:artist]
  end
end
