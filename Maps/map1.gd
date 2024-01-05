extends Node2D

func _ready():
	pass

func _process(delta):
	if get_parent().Checkpoint2 == true:
		$DeathZone.get_node("CollisionArea2D5").disabled = false
	else:
		$DeathZone.get_node("CollisionArea2D5").disabled = true
		
 
func _on_death_zone_body_entered(body):
	get_parent().new_game()

func _on_checkpoint_1_body_entered(body):
	get_parent().Checkpoint1 = true

func _on_checkpoint_2_body_entered(body):
	get_parent().Checkpoint2 = true
