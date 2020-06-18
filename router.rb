class Router
  def initialize(game_controller)
    @game_controller = game_controller
    @running = true
  end

  def run
    puts 'Welcome to Ruby Tic Tac Toe!'
    puts '           --           '

    while @running
      display_menu_actions
      menu_action = gets.chomp.to_i
      route_menu_action(menu_action)
      while @game_controller.in_game?
        display_game_actions
        game_action = gets.chomp.to_i
        route_game_action(game_action)
      end
    end
  end

  private

  def route_menu_action(action)
    case action
    when 1
      @game_controller.begin
    when 2
      stop
    else
      puts 'Please enter 1 or 2'
    end
  end

  def route_game_action(action)
    case action
    when 1
      @game_controller.move
    when 2
      @game_controller.finish
      puts 'Game ended'
    else
      puts 'Please press 1 or 2'
    end
  end

  def stop
    puts "Thank you for playing!"
    @running = false
  end

  def display_menu_actions
    puts ''
    puts 'What would you like to do?'
    puts '1 - New Game'
    puts '2 - Exit'
  end

  def display_game_actions
    puts ''
    puts '1 - Make a Move'
    puts '2 - End this Game'
  end
end
