
require 'rspec'
require 'card'
require 'hand'
require 'player'

describe "Card" do
  describe "initialize" do
    it "initializes a card with the given rank and suit" do
      Card.new("4", "C").should be_an_instance_of Card
    end
  end

  describe "rank" do
    it "returns a card's rank" do
      test_card = Card.new("4", "C")
      test_card.rank.should eq "4"
    end
  end

  describe "suit" do
    it "returns a card's suit" do
      Card.new("4", "H").suit.should eq('H')
    end
  end

end

describe "Hand" do
  describe "initialize" do
    it "accepts an array of cards and stores them internally" do
      Hand.new([  Card.new('4', 'H'), Card.new('5', 'D'), Card.new('6', 'C')]).should be_an_instance_of Hand
    end
  end

  describe "cards" do
    it "displays the cards in a hand" do
      card_1 = Card.new('4', 'H')
      card_2 = Card.new('5', 'D')
      card_3 = Card.new('6', 'C')
      test_hand = Hand.new([card_1, card_2, card_3])
      test_hand.cards.should eq [card_1, card_2, card_3]
    end
  end

  describe "add_cards" do
    it "adds an array of cards to the hand" do
      card_1 = Card.new('4', 'H')
      card_2 = Card.new('5', 'D')
      card_3 = Card.new('6', 'C')
      test_hand = Hand.new([card_1])
      test_hand.add_cards([card_2, card_3])
      test_hand.cards.should eq [card_1, card_2, card_3]
    end
  end

  describe "remove_cards" do
    it "removes all cards of a particular rank from the hand" do
      card_1 = Card.new('4', 'H')
      card_2 = Card.new('5', 'D')
      card_3 = Card.new('5', 'C')
      test_hand = Hand.new([card_1, card_2, card_3])
      test_hand.remove_cards('5')
      test_hand.cards.should eq [card_1]
    end
  end

  describe "has_card?" do
    cards = [Card.new('4', 'H'), Card.new('4', 'D'), Card.new('6', 'd')]
    test_hand = Hand.new(cards)

    it "returns true if a hand of cards contains the given card" do
      test_hand.has_card?('4').should eq true
    end

    it "returns false if a hand of cards does not contain the given card" do
      test_hand.has_card?('J').should eq false
    end
  end

  describe "matches" do
    it "searches hand for cards of a specified rank and returns an array of the matching cards" do
      card_1 = Card.new('4', 'H')
      card_2 = Card.new('4', 'D')
      card_3 = Card.new('6', 'C')
      test_hand = Hand.new([card_1, card_2, card_3])
      test_hand.matches('4').should eq [card_1, card_2]
    end
  end

  describe "book" do
    it "returns the rank if a hand contains a book" do
      cards = [Card.new('4', 'H'), Card.new('4', 'D'), Card.new('4', 'S'), Card.new('4', 'C'), Card.new('Q', 'S'), Card.new('K', 'H')]
      test_hand = Hand.new(cards)
      test_hand.book.should eq '4'
    end

    it "returns an empty string if it doesn't" do
      cards = [Card.new('A', 'H'), Card.new('4', 'D'), Card.new('4', 'S'), Card.new('4', 'C'), Card.new('Q', 'S'), Card.new('K', 'H')]
      test_hand = Hand.new(cards)
      test_hand.book.should eq nil
    end
  end
end

describe "Player" do
  describe "initialize" do
    it "initializes a player with a name" do
      test_player = Player.new("moof")
      test_player.should be_an_instance_of Player
    end
  end
  describe "name" do
    it "returns the player's name" do
      Player.new("moof").name.should eq "moof"
    end
  end
  describe "books" do
    it "returns the number of books a player has so far" do
      Player.new("moof").books.should eq 0
    end
  end
  describe "add_book" do
    it "increases books by 1" do
      moof = Player.new("moof")
      moof.add_book
      moof.books.should eq 1
    end
  end
end























