class Deck
  include Menu

  attr_reader :cards

  def initialize
    @cards = generate_deck
  end

  def take_card
    cards.pop
  end

  def generate_deck
    CARDS.clone.shuffle
  end
end
