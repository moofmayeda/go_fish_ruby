class Hand
  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def add_cards(cards)
    @cards.concat(cards)
  end

  def remove_cards(rank)
    @cards.delete_if {|this_card| this_card.rank == rank}
  end

  def has_card?(rank)
    ranks = @cards.collect {|card| card.rank}
    ranks.include?(rank)
  end

  def matches(rank)
    @cards.select {|card| card.rank == rank}
  end

  def book
    counts = Hash.new 0
    @cards.each do |card|
      counts[card.rank] += 1
    end
    counts.key(4)
  end
end
