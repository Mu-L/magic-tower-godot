extends CanvasLayer

func show_message(text: String):
	var label = Label.new()
	label.text = text
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	# Add shadow for better visibility
	label.add_theme_color_override("font_shadow_color", Color.BLACK)
	label.add_theme_constant_override("shadow_offset_x", 1)
	label.add_theme_constant_override("shadow_offset_y", 1)
	label.add_theme_font_size_override("font_size", 24) 
	
	add_child(label)
	
	# Position: Top Center
	# Using anchors and grow direction to center it
	label.grow_horizontal = Control.GROW_DIRECTION_BOTH
	
	# Get viewport size
	var viewport_size = get_viewport().get_visible_rect().size
	
	# Start position (Top Center, slightly down)
	label.position = Vector2(viewport_size.x / 2, 80)
	
	# Animate
	var tween = create_tween()
	# Move up
	tween.tween_property(label, "position:y", label.position.y - 60, 2.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	# Fade out (start fading halfway through)
	tween.parallel().tween_property(label, "modulate:a", 0.0, 1.0).set_delay(1.0)
	
	# Cleanup
	tween.tween_callback(label.queue_free)
