extends Label

onready var World = get_node("/root/World")

func _ready():
	update_score()

func update_score():
	text = "Score: " + str(World.score)
