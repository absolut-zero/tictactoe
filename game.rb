class Game
  attr_accessor :board, :turn, :player_one, :player_two, :winner

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @turn = player_one
    @winner = nil
    @board = Array.new(9, nil)
  end

  def full?
    @board == @board.compact
  end

  def empty_positions
    @board.map.with_index { |v, i| i + 1 if v.nil? }
  end

  def next_turn
    @turn == @player_one ? @turn = @player_two : @turn = @player_one
  end

  def wins
    [[0, 1, 2],
     [0, 3, 6],
     [0, 4, 8],
     [1, 4, 7],
     [2, 4, 6],
     [2, 5, 8],
     [3, 4, 5],
     [6, 7, 8]]
  end

  def ended?
    @winner || full?
  end

  def finish
    @winner = true
  end
end
