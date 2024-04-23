class User
  attr_reader :name
  attr_accessor :balance, :score, :hand

  def initialize(name)
    @name = name
    @balance = 100
    @hand = []
    @score = 0
  end

  def take_card(deck)
    card = deck.take_card
    hand << card
    self.score += card[:value]
    check_score
  end

  def clear_hand
    self.hand = []
    self.score = 0
  end

  def check_score
    hand.each do |card|
      self.score -= 10 if card[:card].tr('♠♣♦♥', '') == 'A' && self.score > 21
    end
  end
end
