require_relative 'board'
require_relative 'player'
require_relative 'view'

class Controller
  def initialize()
    @player_view = PlayerView.new
    @board_view = BoardView.new
  end
end
