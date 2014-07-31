class Card
  @@cards = []

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @@cards << self
  end

  def Card.clear
    @@cards = []
  end

  def Card.all
    @@cards
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

end
