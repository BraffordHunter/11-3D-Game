extends Area

var speed = 270

var velocity = Vector3()

onready var World = get_node("/root/World")

func start(xform):
	transform = xform
	velocity = transform.basis.z * speed

func _process(delta):
	transform.origin += velocity * delta

func _on_Timer_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	if body is StaticBody:
		queue_free()
	if body.is_in_group("Turkey"):
		#put any other commands here(sound effects, health, etc.)
		World.increase_score(10)
		queue_free()
		body.queue_free()
		