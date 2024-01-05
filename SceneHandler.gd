extends Node


@export var Checkpoint1 = false
@export var Checkpoint2 = false
@export var Checkpoint3 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMenu/MainMenuCamera.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	if Checkpoint2:
		$Player.start($Checkpoint2.position)
	elif Checkpoint3:
		$Player.start($Checkpoint4.position)
	elif Checkpoint1:
		$Player.start($Checkpoint1.position)
	else:
		$Player.start($StartPosition.position)
		
	$Player/PlayerCamera.make_current()


func _on_play_button_pressed():
	new_game()
