extends TextureRect

func _ready():
	rect_min_size = Vector2(80, 80)  # 设置图标的最小大小
	rect_position = Vector2(get_viewport_rect().size.x - rect_size.x, 0)  # 初始位置

func _process(delta):
	# 更新图标的位置（右上角）
	rect_position = Vector2(get_viewport_rect().size.x - rect_size.x, 0)
	# 可以在这里添加代码以调整图标的大小，以适应屏幕的缩放
