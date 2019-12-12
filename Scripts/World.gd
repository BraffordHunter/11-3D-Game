extends Spatial

var lives = 5
var score = 0

func _unhandled_input(event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func increase_score(s):
	score += s
	$HUD/Score.update_score()

func decrease_lives():
	lives -= 1
	if (lives <= 0):
		#End game screen
		get_tree().quit()
	$HUD/Lives.update_lives()