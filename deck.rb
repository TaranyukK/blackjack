class Deck
  attr_reader :cards

  CARDS = [
    { card: '♥2', value: 2 }, { card: '♥3', value: 3 }, { card: '♥4', value: 4 },
    { card: '♥5', value: 5 }, { card: '♥6', value: 6 }, { card: '♥7', value: 7 },
    { card: '♥8', value: 8 }, { card: '♥9', value: 9 }, { card: '♥10', value: 10 },
    { card: '♥J', value: 10 }, { card: '♥Q', value: 10 }, { card: '♥K', value: 10 },
    { card: '♥A', value: 11 },
    { card: '♦2', value: 2 }, { card: '♦3', value: 3 }, { card: '♦4', value: 4 },
    { card: '♦5', value: 5 }, { card: '♦6', value: 6 }, { card: '♦7', value: 7 },
    { card: '♦8', value: 8 }, { card: '♦9', value: 9 }, { card: '♦10', value: 10 },
    { card: '♦J', value: 10 }, { card: '♦Q', value: 10 }, { card: '♦K', value: 10 },
    { card: '♦A', value: 11 },
    { card: '♣2', value: 2 }, { card: '♣3', value: 3 }, { card: '♣4', value: 4 },
    { card: '♣5', value: 5 }, { card: '♣6', value: 6 }, { card: '♣7', value: 7 },
    { card: '♣8', value: 8 }, { card: '♣9', value: 9 }, { card: '♣10', value: 10 },
    { card: '♣J', value: 10 }, { card: '♣Q', value: 10 }, { card: '♣K', value: 10 },
    { card: '♣A', value: 11 },
    { card: '♠2', value: 2 }, { card: '♠3', value: 3 }, { card: '♠4', value: 4 },
    { card: '♠5', value: 5 }, { card: '♠6', value: 6 }, { card: '♠7', value: 7 },
    { card: '♠8', value: 8 }, { card: '♠9', value: 9 }, { card: '♠10', value: 10 },
    { card: '♠J', value: 10 }, { card: '♠Q', value: 10 }, { card: '♠K', value: 10 },
    { card: '♠A', value: 11 }
  ].freeze

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
