extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	self.stop()		
	queue_free()
	pass # Replace with function body.
