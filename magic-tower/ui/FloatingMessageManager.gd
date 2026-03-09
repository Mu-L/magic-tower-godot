extends CanvasLayer

func show_message(text: String):
	var label = Label.new()
	label.text = text
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	# Add outline and shadow for better visibility
	label.add_theme_constant_override("outline_size", 4)
	label.add_theme_color_override("outline_color", Color.BLACK)
	label.add_theme_font_size_override("font_size", 24) 
	
	add_child(label)
	
	# Position: Full width, top center
	label.anchors_preset = Control.PRESET_TOP_WIDE
	label.position.y = 80
	# Ensure width covers the screen so horizontal_alignment centers the text
	# PRESET_TOP_WIDE sets anchors to (0,0,1,0) which is full width.
	
	# Animate
	var tween = create_tween()
	# Move up
	tween.tween_property(label, "position:y", label.position.y - 60, 2.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	# Fade out (start fading halfway through)
	tween.parallel().tween_property(label, "modulate:a", 0.0, 1.0).set_delay(1.0)
	
	# Cleanup
	tween.tween_callback(label.queue_free)
