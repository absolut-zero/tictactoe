require_relative 'game'
require_relative 'player'

class GameView
  def display(game)
    board = game.board.map.with_index { |v, i| v.nil? ? ' ' : v }
    print "\n #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def display_with_places(game)
    board = game.board.map.with_index { |v, i| v.nil? ? i + 1 : v }
    print "\n #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def ask_for_position
    puts "\nWhere would you like to go?"
    gets.chomp.to_i
  end

  def invalid_position(game)
    puts "\nThat is an invalid position, please choose from the following:"
    display_with_places(game)
    puts "\nWhere would you like to go?"
    gets.chomp.to_i
  end

  def show_whos_turn(game)
    puts "\n#{game.turn.name}'s turn:"
  end

  def win_end(game)
    display(game)
    puts "\n#{game.winner.name} (#{game.winner.type}) Wins!!"
  end

  def tie_end(game)
    display(game)
    puts "\nIt's a tie.."
  end
end
