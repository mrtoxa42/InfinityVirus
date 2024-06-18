extends Node2D



var virusarea = false
var currentvirus

func _ready():
	#get_tree().get_root().set_transparent_background(true)
	GameManager.screenmiddle = $MiddleMarker.global_position




func _process(delta):
	$Score/ScoreLabel.text = str(GameManager.score)
	


func _on_score_area_area_entered(area):
	if area.is_in_group("Virus") and virusarea == false:
		currentvirus = area
		virusarea = true
		Virus_damage()


func _on_score_area_area_exited(area):
	if area == currentvirus:
		virusarea = false
		currentvirus = null
	
	
func Virus_damage():
	var timer = get_tree().create_timer(1)
	await timer.timeout
	if virusarea == true:
		GameManager.score -=1
		Virus_damage()
