extends Node


var screenmiddle
var score = 0

var countvirus = 0

var save_path = "user://score.save"

func _ready():
	#DirAccess.remove_absolute(save_path)
	pass
func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(score)
	


func load_game():
	if FileAccess.file_exists(save_path):
		print("File found")
		var file = FileAccess.open(save_path, FileAccess.READ)
		GameManager.score = file.get_var()
	else:
		print("File not found")
		GameManager.score = 0
