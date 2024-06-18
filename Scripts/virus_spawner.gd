extends Marker2D

var virus = preload("res://Scenes/virus.tscn")





func _on_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize
	var r = rng.randi_range(0,3)
	if r == 2:
		var Virus = virus.instantiate()
		get_tree().get_root().add_child(Virus)
		Virus.global_position = global_position
