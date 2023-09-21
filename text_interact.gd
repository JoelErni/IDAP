extends StaticBody3D

var player_distance = 5
var interact_distance = 2
var state_machine
var is_visible = false
var interactable = false
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../Player")
	state_machine = $AnimationTree.get("parameters/playback")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	delta = delta
	
	var distance = global_transform.origin.distance_to(player.global_transform.origin)
	
	if distance <= player_distance:
		state_machine.travel("show")
	else:
		state_machine.travel("hide")

	if distance <= interact_distance:
		$InteractLabel.visible = true
		interactable = true
	else:
		$InteractLabel.visible = false
		interactable = false

	if interactable and Input.is_action_just_pressed("interact"):
		player.get_node("AnimationTree").get("parameters/playback").travel("darken")
	elif not interactable:
		player.get_node("AnimationTree").get("parameters/playback").travel("brighten")
