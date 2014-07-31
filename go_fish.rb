require './lib/player'
require './lib/hand'
require './lib/card'


['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |rank|
  ['H','D','Q','C'].each do |suit|
    Card.new(rank, suit)
  end
end

@turn = 1
def whose_turn
  @turn.odd? ? 1 : 2
end

@player_one_hand = Card.all.sample(7)
@player_one_hand.each {|card| Card.all.delete(card)}
@player_two_hand = Card.all.sample(7)
@player_two_hand.each {|card| Card.all.delete(card)}
@deck = Hand.new(Card.all)

puts "GO FISH!"

def play
  puts "Player #{whose_turn}'s cards:"
  @player_one_hand.each {|card| puts "#{card.rank}#{card.suit}"}

  turn += 1

end
play
