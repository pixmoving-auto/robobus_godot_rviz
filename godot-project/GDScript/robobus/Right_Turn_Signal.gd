extends TextureRect

var blink_timer := Timer.new()
var is_visible := true
var right_turn_report = TurnSignalReport.new()
var is_blinking := false

func _ready():
	right_turn_report.subscribe("/vehicle/status/turn_indicators_status", false)
	# 设置计时器的间隔（以秒为单位）
	blink_timer.wait_time = 0.5
	# 将计时器连接到函数_on_blink_timer_timeout
	blink_timer.connect("timeout", self, "_on_blink_timer_timeout")
	# 启动计时器
	blink_timer.start()

func _process(_delta):
	if !right_turn_report.has_new():
		print("No new turn signal data.")
		return

	var right_turn_status = right_turn_report.get_turn_report()

	if right_turn_status == 3 and !is_blinking:
		print("Right turn signal is active.")
		_on_blink_timer_timeout()
		is_blinking = true
	elif right_turn_status != 3:
		print("Right turn signal is not active.")
		is_blinking = false
		self.is_visible = false
		# 在这里执行其他操作，例如停止闪烁效果

	# 标记数据为旧数据
	right_turn_report.set_old()

func _on_blink_timer_timeout():
	# 切换图片的可见性
	is_visible = !is_visible
	# 通过修改颜色的透明度来实现闪烁效果
	if is_visible:
		self.modulate.a = 1.0  # 完全可见
	else:
		self.modulate.a = 0.0  # 完全不可见
	# 更新TextureRect的可见性
	self.visible = is_visible
