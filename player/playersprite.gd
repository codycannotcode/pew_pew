extends Sprite

const left_down = Vector2(-1, 1)
const right_down = Vector2(1, 1)
const left_up = Vector2(-1, -1)
const right_up = Vector2(1, -1)

const SPRITES = {
	left_down: preload("res://assets/girl_left_front.png"),
	right_down: preload("res://assets/girl_right_front.png"),
	left_up: preload("res://assets/girl_left_back.png"),
	right_up: preload("res://assets/girl_right_back.png")
}

func _physics_process(_delta):
	var relative_mouse = get_local_mouse_position()
	var look_vector = Vector2(sign(relative_mouse.x) * 1, sign(relative_mouse.y) * 1)
	
	texture = SPRITES[look_vector]
