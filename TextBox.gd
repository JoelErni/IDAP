extends Label

var text_message = 'This is a test message'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_text():
	for x in range(0, len(text_message)):
		await get_tree().create_timer(0.05).timeout
		text = text_message.left(x+1)

func hide_text():
	text = ''
