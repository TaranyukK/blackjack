require_relative 'deck'
require_relative 'user'
require_relative 'menu'

class Game
  include Menu

  def initialize
    @dealer = User.new('Dealer')
  end

  def start
    START_MENU.map { |item| puts item }
    @player = User.new(gets.chomp)
    preparation
  end

  def preparation
    @deck = Deck.new

    2.times do
      @player.take_card(@deck)
      @dealer.take_card(@deck)
    end

    @player.balance -= 10
    @dealer.balance -= 10

    puts 'Game begins! Your turn!'

    player_turn
  end

  def player_turn
    show_cards
    show_items(PLAYERS_TURN)
    case gets.to_i
    when 1
      dealer_turn
    when 2
      @player.take_card(@deck)
      dealer_turn
    when 3
      showdown
    else
      pust 'Invalid argument!'
      player_turn
    end
  end

  def dealer_turn
    @dealer.take_card(@deck) if @dealer.score < 17
    showdown
  end

  def showdown
    if @dealer.score > 21 || (@player.score > @dealer.score && @player.score <= 21)
      show_cards(true)

      puts 'Great job, soldier! You win!'

      @player.balance += 20
    elsif @player.score > 21 || (@dealer.score > @player.score && @dealer.score <= 21)
      show_cards(true)
      puts 'You lose, son!'

      @dealer.balance += 20
    elsif @player.score > 21 && @dealer.score > 21 || @player.score == @dealer.score
      show_cards(true)
      puts 'It`s a tie!'

      @player.balance += 10
      @dealer.balance += 10
    end
    replay
  end

  def replay
    puts 'Do you want to play again?'
    show_items(PLAY_AGAIN)
    case gets.to_i
    when 1
      clear_hands
      preparation
    when 2
      puts 'Bye!'
      nil
    end
  end

  def clear_hands
    @player.clear_hand
    @dealer.clear_hand
  end

  def show_items(items)
    items.each_with_index { |item, index| puts "#{index + 1}. #{item}" }
  end

  def show_cards(showdown = false)
    puts "Your cards: #{user_cards(@player.hand)}, score: #{@player.score}, balance: #{@player.balance}"
    if showdown
      puts "Dealers cards: #{user_cards(@dealer.hand)}, score: #{@dealer.score}, balance: #{@dealer.balance}"
    else
      puts "Dealer`s cards: #{'** ' * @dealer.hand.length}, balance: #{@dealer.balance}"
    end
  end

  def user_cards(hand)
    hand.map { |card| card[:card] }.join(',')
  end
end

bj = Game.new

bj.start
