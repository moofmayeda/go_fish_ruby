class Player

  def initialize(name)
    @name = name
    @books = 0
  end

  def name
    @name
  end

  def books
    @books
  end

  def add_book
    @books += 1
  end

end
