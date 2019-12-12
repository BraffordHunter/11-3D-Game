extends Label

onready var World = get_node("/root/World")

func _ready():
	update_lives()

func update_lives():
	text = "Lives: " + str(World.lives)
