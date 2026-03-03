extends Control

func _ready():
	# Make sure the controls are visible and enabled
	if has_node("Control"):
		$Control.visible = true
		_setup_touch_buttons()

func _setup_touch_buttons():
	for child in $Control.get_children():
		if child is TouchScreenButton:
			var original_scale = child.scale
			var original_pos = child.position
			var texture_size = child.texture_normal.get_size() if child.texture_normal else Vector2.ZERO
			
			# Connect pressed signal
			child.pressed.connect(func(): _animate_button(child, original_scale * 0.8, original_pos, original_scale, texture_size))
			
			# Connect released signal
			child.released.connect(func(): _animate_button(child, original_scale, original_pos, original_scale, texture_size))

func _animate_button(btn: TouchScreenButton, target_scale: Vector2, base_pos: Vector2, base_scale: Vector2, texture_size: Vector2):
	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(btn, "scale", target_scale, 0.1)
	
	# Calculate position offset to keep center fixed
	# NewPos = BasePos + Rotated((BaseScale - TargetScale) * Size / 2)
	var scale_diff = base_scale - target_scale
	var offset = (scale_diff * texture_size) / 2.0
	var rotated_offset = offset.rotated(btn.rotation)
	var target_pos = base_pos + rotated_offset
	
	tween.tween_property(btn, "position", target_pos, 0.1)
