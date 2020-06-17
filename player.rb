class Player
  attr_reader :type, :name
  attr_accessor :score

  def initialize(type, player_name)
    @type = type
    @name = player_name
  end
end
