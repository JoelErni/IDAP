extends StaticBody3D

var player_distance = 5
var is_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var animationPalayer = get_node("AnimationPlayer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func _physics_process(delta):
	var distance = global_transform.origin.distance_to(get_parent().get_parent().get_node("Player").global_transform.origin)
	
	if distance <= player_distance and not is_visible:
		$AnimationPlayer.play("show")
		is_visible = true
	elif is_visible:
		$AnimationPlayer
	elif distance > player_distance and is_visible: 
		$AnimationPlayer.
