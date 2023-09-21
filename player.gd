extends CharacterBody3D

const speed = 2.5
const jump_force = 5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var target_velocity = Vector3.ZERO

func _process(delta):
	delta = delta

	if position.y < -100:
		position = Vector3(0, 10, 0)
		velocity = Vector3.ZERO

# Movement
func _physics_process(delta):
	delta = delta

	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	# Movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(direction.x, 0, speed)
		velocity.z = move_toward(direction.z, 0, speed)

	# Player Model Rotation
	var playermodel = get_node("Player-model")
	
	if velocity and is_on_floor():
		playermodel.look_at(transform.origin + Vector3(velocity.x, 0 ,velocity.z), Vector3.UP)

	move_and_slide()
