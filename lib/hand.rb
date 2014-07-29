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
    # ranks = @cards.collect {|card| card.rank }
    # [ 'A', 'J', 'Q', 'K',
    #   '10', '9', '8', '7',
    #   '6', '5', '4', '3', '2'].each do | test_rank |
    #   if ranks.count(test_rank) == 4
    #     return test_rank
    #   end
    # end
    # ''
    counts = Hash.new 0
    @cards.each do |card|
      counts[card.rank] += 1
    end
    counts.key(4)
  end
end
