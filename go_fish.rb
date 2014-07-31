require './lib/player'
require './lib/hand'
require './lib/card'


['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |rank|
  ['H','D','S','C'].each do |suit|
    Card.new(rank, suit)
  end
end

@turn = 1
def whose_turn
  @turn.odd? ? "one" : "two"
end
@player_one = Player.new("moof")
@player_two = Player.new("JJ")
@player_one_hand = Hand.new(Card.all.sample(7))
@player_one_hand.cards.each {|card| Card.all.delete(card)}
@player_two_hand = Hand.new(Card.all.sample(7))
@player_two_hand.cards.each {|card| Card.all.delete(card)}
@deck = Hand.new(Card.all)

def play
  if @turn.odd?
   @my_hand = @player_one_hand
   @opponent_hand = @player_two_hand
   @current_player = @player_one
  else
   @my_hand = @player_two_hand
   @opponent_hand = @player_one_hand
   @current_player = @player_two
  end
  puts "Player #{whose_turn} has #{@current_player.books} books."
  puts "Player #{whose_turn}'s cards:"
  @my_hand.cards.sort_by{|card| card.rank}.each {|card| puts "#{card.rank}#{card.suit}"}
  puts "What rank do you want to ask the other player for?"
  if @opponent_hand.has_card?(gets.chomp)

  else
    puts "sorry, go fish!"
    removed = @deck.cards.sample
    @deck.cards.delete(removed)
    @my_hand.add_cards([removed])
    puts "you drew a #{removed.rank}#{removed.suit}"
    check_for_book
    end_of_game
    turn
  end
  @turn += 1

end

def end_of_game
  @my_hand.cards.length == 0 ? exit : "continue"
end

def check_for_book
  if @my_hand.book != nil
    @current_player.add_book
    @my_hand.remove_cards(@my_hand.book)
  end
end

puts "GO FISH!"
play
