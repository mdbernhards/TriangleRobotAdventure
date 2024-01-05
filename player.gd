extends CharacterBody2D

signal hit

@export var speed = 300
@export var jumpSpeed = -400

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	velocity.y += gravity * delta
	if $Music.playing == false:
		$Music.play()
	
	if Input.is_action_pressed("move_up") and (is_on_floor() or is_on_wall()):
		velocity.y = jumpSpeed


	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.flip_v = velocity.y > 0
		

func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()


