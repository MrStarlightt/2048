extends Node2D

signal merged_1
signal merged_2
signal merged_3
signal merged_4
signal merged_5
signal merged_6
signal merged_7
signal merged_8
signal merged_9

signal loss

@export var input_up = "up"
@export var input_down = "down"
@export var input_right = "right"
@export var input_left = "left"

var grid = [1, 1, 1, 0, 
			0, 1, 0, 0, 
			1, 0, 0, 0, 
			0, 0, 1, 0]

var filled = []

var row_y_1 = [0, 4, 8, 12]
var row_y_2 = [1, 5, 9, 13]
var row_y_3 = [2, 6 ,10, 14]
var row_y_4 = [3, 7, 11, 15]
var y_rows = [row_y_1,row_y_2,row_y_3,row_y_4]

var row_x_1 = [0,1,2,3]
var row_x_2 = [4,5,6,7]
var row_x_3 = [8,9,10,11]
var row_x_4 = [12,13,14,15]
var x_rows = [row_x_1,row_x_2,row_x_3,row_x_4]


var availability = [true, true, true, true]

var block1 = preload("./blocks/1.tscn")
var block2 = preload("./blocks/2.tscn")
var block3 = preload("./blocks/3.tscn")
var block4 = preload("./blocks/4.tscn")
var block5 = preload("./blocks/5.tscn")
var block6 = preload("./blocks/6.tscn")
var block7 = preload("./blocks/7.tscn")
var block8 = preload("./blocks/8.tscn")
var block9 = preload("./blocks/9.tscn")
var block10 = preload("./blocks/10.tscn")

func _ready() -> void:
	visualize()


func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed(input_up):
		ultimate_move_func("y", "positive")
		spawn_new()
	
	if Input.is_action_just_pressed(input_down):
		ultimate_move_func("y", "negative")
		spawn_new()
	
	if Input.is_action_just_pressed(input_right):
		ultimate_move_func("x", "negative")
		spawn_new()
	
	if Input.is_action_just_pressed(input_left):
		ultimate_move_func("x", "positive")
		spawn_new()



func ultimate_move_func(axis, dir):
	
	check_filled_slots()
	
	var v_1 = 0
	var v_2 = 0
	var v_3 = 0
	var v_4 = 0
	
	
	match dir:
		"positive":
			v_1 = 0
			v_2 = 1
			v_3 = 2
			v_4 = 3
		"negative":
			v_1 = 3
			v_2 = 2
			v_3 = 1
			v_4 = 0
	
	match axis:
		"x":
			axis = x_rows
		"y":
			axis = y_rows
	
	
	#test()
	for i in range(4):
		
		# check if the next slot is filled
		if axis[i][v_2] in filled: # is filled
			
			# earlier is the same type
			if grid[axis[i][v_1]] == grid[axis[i][v_2]]:
				grid[axis[i][v_1]] += 1
				grid[axis[i][v_2]] = 0
				
				emit_right_signal(grid[axis[i][v_1]])
				
				availability[0] = false
				
			# earliest empty
			elif grid[axis[i][v_1]] == 0:
				grid[axis[i][v_1]] = grid[axis[i][v_2]]
				grid[axis[i][v_2]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if axis[i][v_3] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[axis[i][v_2]] == grid[axis[i][v_3]]:
				grid[axis[i][v_2]] += 1
				grid[axis[i][v_3]] = 0
				
				emit_right_signal(grid[axis[i][v_1]])
				
			# slot 2 is empty
			elif grid[axis[i][v_2]] == 0:
				# slot 1 and 3 are same
				if grid[axis[i][v_1]] == grid[axis[i][v_3]] and availability[0] == true:
					grid[axis[i][v_1]] += 1
					grid[axis[i][v_3]] = 0
					
					availability[0] = false
					
					emit_right_signal(grid[axis[i][v_1]])
					
				elif grid[axis[i][v_1]] == 0:
					grid[axis[i][v_1]] = grid[axis[i][v_3]]
					grid[axis[i][v_3]] = 0
					
				else:
					grid[axis[i][v_2]] = grid[axis[i][v_3]]
					grid[axis[i][v_3]] = 0
		
		
		
		
		## Fourth
		# check if the next slot is filled
		if axis[i][v_4] in filled: # is filled
			
			
			# slot 3 and 4 are same
			if grid[axis[i][v_3]] == grid[axis[i][v_4]]:
				grid[axis[i][v_3]] += 1
				grid[axis[i][v_4]] = 0
				
				emit_right_signal(grid[axis[i][v_1]])
				
			# slot 3 is empty
			elif grid[axis[i][v_3]] == 0:
				
				# slot 2 and 4 are same
				if grid[axis[i][v_2]] == grid[axis[i][v_4]] and availability[1] == true:
					grid[axis[i][v_2]] += 1
					grid[axis[i][v_4]] = 0
					availability[v_2] = false
					
					emit_right_signal(grid[axis[i][v_1]])
				
				# slot 2 is empty
				elif grid[axis[i][v_2]] == 0:
					# slot 1 and 4 are same
					if grid[axis[i][v_1]] == grid[axis[i][v_4]] and availability[0] == true:
						grid[axis[i][v_1]] += 1
						grid[axis[i][v_4]] = 0
						
						availability[v_1] = false
						
						emit_right_signal(grid[axis[i][v_1]])
					
					# slot 1 is empty
					elif grid[axis[i][v_1]] == 0:
						grid[axis[i][v_1]] = grid[axis[i][v_4]]
						grid[axis[i][v_4]] = 0
					
					else:
						
						grid[axis[i][v_2]] = grid[axis[i][v_4]]
						grid[axis[i][v_4]] = 0
				else:
					grid[axis[i][v_3]] = grid[axis[i][v_4]]
					grid[axis[i][v_4]] = 0
	
		availability[0] = true
		availability[1] = true
		availability[2] = true
		availability[3] = true 


func spawn_new():
	check_filled_slots()
	
	var rand_num = round(randf_range(0, 15))
	var rand_rare = round(randf_range(1,4))
	
	var loop_destroyer_2000 = 0
	
	while true:
		
		if int(rand_num) in filled:
			rand_num = round(randf_range(-0.5, 15.4))
			loop_destroyer_2000 += 1
			if loop_destroyer_2000 == 20000:
				emit_signal("loss")
				break
		else:
			loop_destroyer_2000 = 0
			if rand_rare == 4:
				grid[rand_num] = 2
			else:
				grid[rand_num] = 1
			break
	
	visualize()


func emit_right_signal(slot):
	match slot:
		2:emit_signal("merged_1")
		3:emit_signal("merged_2")
		4:emit_signal("merged_3")
		5:emit_signal("merged_4")
		6:emit_signal("merged_5")
		7:emit_signal("merged_6")
		8:emit_signal("merged_7")
		9:emit_signal("merged_8")
		10:emit_signal("merged_9")


func check_filled_slots():
	
	filled = []
	
	for i in grid.size():
		
		if grid[i] > 0:
			filled.append(i)


func visualize():
	check_filled_slots()
	
	reverse_summon()
	
	for i in filled.size():
		match grid[filled[i]]:
			1:
				summon(filled[i], block1)
			2:
				summon(filled[i], block2)
			3:
				summon(filled[i], block3)
			4:
				summon(filled[i], block4)
			5:
				summon(filled[i], block5)
			6:
				summon(filled[i], block6)


func summon(order_num:int, type_of_block):
	var object = type_of_block.instantiate()
	object.global_position = $Node2D.get_child(order_num).global_position
	object.scale = scale
	$blocks.add_child(object)


func reverse_summon():
	for child in $blocks.get_children():
		child.queue_free()
