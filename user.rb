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
    self.score += if card[:card].tr('♠♣♦♥', '') == 'A'
                    self.score + 11 < 21 ? 11 : 1
                  else
                    card[:value]
                  end
  end

  def clear_hand
    self.hand = []
    self.score = 0
  end
end
