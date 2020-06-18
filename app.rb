require_relative 'game_controller'
require_relative 'router'

game_controller = GameController.new

router = Router.new(game_controller)

router.run
