require_relative 'game'
require_relative 'player'
require_relative 'game_view'

class GameController
  def initialize
    @game_view = GameView.new
  end

  def begin
    player_one = Player.new('X', 'P1')
    player_two = Player.new('O', 'P2')
    @game = Game.new(player_one, player_two)
    display_board
  end

  def move
    display_board
    @game_view.show_whos_turn(@game)
    display_positions
    position = @game_view.ask_for_position
    until @game.empty_positions.include? position
      position = @game_view.invalid_position(@game)
    end
    @game.board[position - 1] = @game.turn.type
    if winner?
      show_win_end_game
    elsif full?
      show_tie_end_game
    elsif second_last_turn? && tie?
      @game.winnner = 'tie'
      show_tie_end_game
    else
      @game.next_turn
      display_board
    end
  end

  def display_board
    @game_view.display(@game)
  end

  def display_positions
    @game_view.display_with_places(@game)
  end

  def in_game?
    if @game
      !@game.ended?
    else
      false
    end
  end

  def winner?
    @game.wins.each do |w|
      if [@game.board[w[0]], @game.board[w[1]], @game.board[w[2]]].compact.count == 3
        unless [@game.board[w[0]], @game.board[w[1]], @game.board[w[2]]].include?('X') && [@game.board[w[0]], @game.board[w[1]], @game.board[w[2]]].include?('O')
          if @game.player_one.type == @game.board[w[0]]
            @game.winner = @game.player_one
          else
            @game.winner = @game.player_two
          end
          return true
        end
      end
    end
    false
  end

  def second_last_turn?
    @game.board.compact.count == 8
  end

  def tie?
    empty_pos = @game.board.map.with_index { |x, i| i if x.nil? }.compact.first
    next_board = @game.board.dup
    next_board[empty_pos] = @game.player_two.type if @game.turn == @game.player_one
    next_board[empty_pos] = @game.player_one.type if @game.turn == @game.player_two
    win = false
    @game.wins.each do |w|
      unless [next_board[w[0]], next_board[w[1]], next_board[w[2]]].include?('X') && [next_board[w[0]], next_board[w[1]], next_board[w[2]]].include?('O')
        win = true
      end
    end
    win ? false : true
  end

  def show_win_end_game
    @game_view.win_end(@game)
  end

  def show_tie_end_game
    @game_view.tie_end(@game)
  end

  def full?
    @game.full?
  end

  def finish
    @game.finish
  end
end
