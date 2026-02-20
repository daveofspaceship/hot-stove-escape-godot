extends Node2D

@onready var game_ui = $GameUI
@onready var player = $Player

var game_over = false

func _ready():
	process_mode = PROCESS_MODE_ALWAYS
	# Ensure the player is visible
	player.visible = true
	# Pause the game at the start
	get_tree().paused = true
	# Show the start message
	game_ui.show_message("Press Space to Jump and Escape the Heat!\n(Press R to Restart anytime)")
	# Connect signals
	player.connect("died", on_player_died)
	# Find the fridge and connect its signal
	var fridge = find_child("Fridge")
	if fridge:
		fridge.connect("player_won", on_player_won)

func _input(event):
	# Handle restart input explicitly when game over
	if game_over and event.is_action_pressed("reset_game"):
		get_tree().paused = false
		get_tree().reload_current_scene()
		return

	# Handle start input
	if event.is_action_pressed("ui_accept") and get_tree().paused and not game_over:
		get_tree().paused = false
		game_ui.hide_message()

func on_player_died():
	game_over = true
	get_tree().paused = true
	game_ui.show_game_over()

func on_player_won():
	game_over = true
	get_tree().paused = true
	game_ui.show_win()
