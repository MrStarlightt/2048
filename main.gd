extends Node2D

var grid = [0, 0, 0, 0, 
			0, 1, 0, 0, 
			0, 0, 0, 0, 
			0, 0, 0, 0]

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

var first = preload("res://blocks/1.tscn")
var second = preload("res://blocks/2.tscn")
var third = preload("res://blocks/3.tscn")
var fourth = preload("res://blocks/4.tscn")
var fifth = preload("res://blocks/5.tscn")
var sixth = preload("res://blocks/6.tscn")


var i = 1

func _ready() -> void:
	visualize()


func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("up"):
		move_up()
		spawn_new()
	
	if Input.is_action_just_pressed("down"):
		move_down()
		spawn_new()
	
	if Input.is_action_just_pressed("right"):
		move_righ()
		spawn_new()
	
	if Input.is_action_just_pressed("left"):
		move_left()
		spawn_new()


func move_up():
	
	check_filled_slots()
	
	#test()
	for i in range(4):
		
		# check if the next slot is filled
		if y_rows[i][1] in filled: # is filled
			
			# earlier is the same type
			if grid[y_rows[i][0]] == grid[y_rows[i][1]]:
				grid[y_rows[i][0]] += 1
				grid[y_rows[i][1]] = 0
				
				availability[0] = false
				
			# earliest empty
			elif grid[y_rows[i][0]] == 0:
				grid[y_rows[i][0]] = grid[y_rows[i][1]]
				grid[y_rows[i][1]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if y_rows[i][2] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[y_rows[i][1]] == grid[y_rows[i][2]]:
				grid[y_rows[i][1]] += 1
				grid[y_rows[i][2]] = 0
				
			# slot 2 is empty
			elif grid[y_rows[i][1]] == 0:
				# slot 1 and 3 are same
				if grid[y_rows[i][0]] == grid[y_rows[i][2]] and availability[0] == true:
					grid[y_rows[i][0]] += 1
					grid[y_rows[i][2]] = 0
					
					availability[0] = false
					
				elif grid[y_rows[i][0]] == 0:
					grid[y_rows[i][0]] = grid[y_rows[i][2]]
					grid[y_rows[i][2]] = 0
					
				else:
					grid[y_rows[i][1]] = grid[y_rows[i][2]]
					grid[y_rows[i][2]] = 0
		
		
		
		
		## Fourth
		# check if the next slot is filled
		if y_rows[i][3] in filled: # is filled
			
			
			# slot 3 and 4 are same
			if grid[y_rows[i][2]] == grid[y_rows[i][3]]:
				grid[y_rows[i][2]] += 1
				grid[y_rows[i][3]] = 0
				
			# slot 3 is empty
			elif grid[y_rows[i][2]] == 0:
				
				# slot 2 and 4 are same
				if grid[y_rows[i][1]] == grid[y_rows[i][3]] and availability[1] == true:
					grid[y_rows[i][1]] += 1
					grid[y_rows[i][3]] = 0
					availability[1] = false
				
				# slot 2 is empty
				elif grid[y_rows[i][1]] == 0:
					# slot 1 and 4 are same
					if grid[y_rows[i][0]] == grid[y_rows[i][3]] and availability[0] == true:
						grid[y_rows[i][0]] += 1
						grid[y_rows[i][3]] = 0
						
						availability[0] = false
					
					# slot 1 is empty
					elif grid[y_rows[i][0]] == 0:
						grid[y_rows[i][0]] = grid[y_rows[i][3]]
						grid[y_rows[i][3]] = 0
					
					else:
						
						grid[y_rows[i][1]] = grid[y_rows[i][3]]
						grid[y_rows[i][3]] = 0
				else:
					grid[y_rows[i][2]] = grid[y_rows[i][3]]
					grid[y_rows[i][3]] = 0
	
		availability[0] = true
		availability[1] = true
		availability[2] = true
		availability[3] = true 

func move_down():
	
	check_filled_slots()
	
	#test()
	for i in range(4):
		
		# check if the next slot is filled
		if y_rows[i][2] in filled: # is filled
			
			# 1 and 2 are same
			if grid[y_rows[i][3]] == grid[y_rows[i][2]]:
				grid[y_rows[i][3]] += 1
				grid[y_rows[i][2]] = 0
				
				availability[3] = false
				
			# 1 is empty
			elif grid[y_rows[i][3]] == 0:
				grid[y_rows[i][3]] = grid[y_rows[i][2]]
				grid[y_rows[i][2]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if y_rows[i][1] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[y_rows[i][2]] == grid[y_rows[i][1]]:
				grid[y_rows[i][2]] += 1
				grid[y_rows[i][1]] = 0
				
				availability[2] = false
				
			# slot 2 is empty
			elif grid[y_rows[i][2]] == 0:
				# slot 1 and 3 are same
				if grid[y_rows[i][3]] == grid[y_rows[i][1]] and availability[3] == true:
					grid[y_rows[i][3]] += 1
					grid[y_rows[i][1]] = 0
					
					availability[3] = false
					
				elif grid[y_rows[i][3]] == 0:
					grid[y_rows[i][3]] = grid[y_rows[i][1]]
					grid[y_rows[i][1]] = 0
					
				else:
					grid[y_rows[i][2]] = grid[y_rows[i][1]]
					grid[y_rows[i][1]] = 0
		
		
		
		
		## Fourth
		# check if the next slot is filled
		if y_rows[i][0] in filled: # is filled
			
			
			# slot 3 and 4 are same
			if grid[y_rows[i][1]] == grid[y_rows[i][0]]:
				grid[y_rows[i][1]] += 1
				grid[y_rows[i][0]] = 0
				
			# slot 3 is empty
			elif grid[y_rows[i][1]] == 0:
				
				# slot 2 and 4 are same
				if grid[y_rows[i][2]] == grid[y_rows[i][0]] and availability[2] == true:
					grid[y_rows[i][2]] += 1
					grid[y_rows[i][0]] = 0
				
				# slot 2 is empty
				elif grid[y_rows[i][2]] == 0:
					# slot 1 and 4 are same
					if grid[y_rows[i][3]] == grid[y_rows[i][0]] and availability[3] == true:
						grid[y_rows[i][3]] += 1
						grid[y_rows[i][0]] = 0
					
					# slot 1 is empty
					elif grid[y_rows[i][3]] == 0:
						grid[y_rows[i][3]] = grid[y_rows[i][0]]
						grid[y_rows[i][0]] = 0
					
					else:
						
						grid[y_rows[i][2]] = grid[y_rows[i][0]]
						grid[y_rows[i][0]] = 0
				else:
					grid[y_rows[i][1]] = grid[y_rows[i][0]]
					grid[y_rows[i][0]] = 0
	
		availability[0] = true
		availability[1] = true
		availability[2] = true
		availability[3] = true 

func move_righ():
		
	check_filled_slots()
	
	#test()
	for i in range(4):
		
		# check if the next slot is filled
		if x_rows[i][2] in filled: # is filled
			
			# 1 and 2 are same
			if grid[x_rows[i][3]] == grid[x_rows[i][2]]:
				grid[x_rows[i][3]] += 1
				grid[x_rows[i][2]] = 0
				
				availability[3] = false
				
			# 1 is empty
			elif grid[x_rows[i][3]] == 0:
				grid[x_rows[i][3]] = grid[x_rows[i][2]]
				grid[x_rows[i][2]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if x_rows[i][1] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[x_rows[i][2]] == grid[x_rows[i][1]]:
				grid[x_rows[i][2]] += 1
				grid[x_rows[i][1]] = 0
				
				availability[2] = false
				
			# slot 2 is empty
			elif grid[x_rows[i][2]] == 0:
				# slot 1 and 3 are same
				if grid[x_rows[i][3]] == grid[x_rows[i][1]] and availability[3] == true:
					grid[x_rows[i][3]] += 1
					grid[x_rows[i][1]] = 0
					
					availability[3] = false
					
				elif grid[x_rows[i][3]] == 0:
					grid[x_rows[i][3]] = grid[x_rows[i][1]]
					grid[x_rows[i][1]] = 0
					
				else:
					grid[x_rows[i][2]] = grid[x_rows[i][1]]
					grid[x_rows[i][1]] = 0
		
		
		
		
		## Fourth
		# check if the next slot is filled
		if x_rows[i][0] in filled: # is filled
			
			
			# slot 3 and 4 are same
			if grid[x_rows[i][1]] == grid[x_rows[i][0]]:
				grid[x_rows[i][1]] += 1
				grid[x_rows[i][0]] = 0
				
			# slot 3 is empty
			elif grid[x_rows[i][1]] == 0:
				
				# slot 2 and 4 are same
				if grid[x_rows[i][2]] == grid[x_rows[i][0]] and availability[2] == true:
					grid[x_rows[i][2]] += 1
					grid[x_rows[i][0]] = 0
				
				# slot 2 is empty
				elif grid[x_rows[i][2]] == 0:
					# slot 1 and 4 are same
					if grid[x_rows[i][3]] == grid[x_rows[i][0]] and availability[3] == true:
						grid[x_rows[i][3]] += 1
						grid[x_rows[i][0]] = 0
					
					# slot 1 is empty
					elif grid[x_rows[i][3]] == 0:
						grid[x_rows[i][3]] = grid[x_rows[i][0]]
						grid[x_rows[i][0]] = 0
					
					else:
						
						grid[x_rows[i][2]] = grid[x_rows[i][0]]
						grid[x_rows[i][0]] = 0
				else:
					grid[x_rows[i][1]] = grid[x_rows[i][0]]
					grid[x_rows[i][0]] = 0
	
		availability[0] = true
		availability[1] = true
		availability[2] = true
		availability[3] = true 

func move_left():
	check_filled_slots()
	
	#test()
	for i in range(4):
		
		# check if the next slot is filled
		if x_rows[i][1] in filled: # is filled
			
			# earlier is the same type
			if grid[x_rows[i][0]] == grid[x_rows[i][1]]:
				grid[x_rows[i][0]] += 1
				grid[x_rows[i][1]] = 0
				
				availability[0] = false
				
			# earliest empty
			elif grid[x_rows[i][0]] == 0:
				grid[x_rows[i][0]] = grid[x_rows[i][1]]
				grid[x_rows[i][1]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if x_rows[i][2] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[x_rows[i][1]] == grid[x_rows[i][2]]:
				availability[1] = false
				grid[x_rows[i][1]] += 1
				grid[x_rows[i][2]] = 0
				
			# slot 2 is empty
			elif grid[x_rows[i][1]] == 0:
				# slot 1 and 3 are same
				if grid[x_rows[i][0]] == grid[x_rows[i][2]] and availability[0] == true:
					grid[x_rows[i][0]] += 1
					grid[x_rows[i][2]] = 0
					
					availability[0] = false
				
				# slot 1 empty
				elif grid[x_rows[i][0]] == 0:
					grid[x_rows[i][0]] = grid[x_rows[i][2]]
					grid[x_rows[i][2]] = 0
					
				else:
					grid[x_rows[i][1]] = grid[x_rows[i][2]]
					grid[x_rows[i][2]] = 0
		
		
		
		
		## Fourth
		# check if the next slot is filled
		if x_rows[i][3] in filled: # is filled
			
			
			# slot 3 and 4 are same
			if grid[x_rows[i][2]] == grid[x_rows[i][3]]:
				grid[x_rows[i][2]] += 1
				grid[x_rows[i][3]] = 0
				
			# slot 3 is empty
			elif grid[x_rows[i][2]] == 0:
				
				# slot 2 and 4 are same
				if grid[x_rows[i][1]] == grid[x_rows[i][3]] and availability[1] == true:
					grid[x_rows[i][1]] += 1
					grid[x_rows[i][3]] = 0
				
				# slot 2 is empty
				elif grid[x_rows[i][1]] == 0:
					# slot 1 and 4 are same
					if grid[x_rows[i][0]] == grid[x_rows[i][3]] and availability[0] == true:
						grid[x_rows[i][0]] += 1
						grid[x_rows[i][3]] = 0
					
					# slot 1 is empty
					elif grid[x_rows[i][0]] == 0:
						grid[x_rows[i][0]] = grid[x_rows[i][3]]
						grid[x_rows[i][3]] = 0
					
					else:
						
						grid[x_rows[i][1]] = grid[x_rows[i][3]]
						grid[x_rows[i][3]] = 0
				else:
					grid[x_rows[i][2]] = grid[x_rows[i][3]]
					grid[x_rows[i][3]] = 0
	
		availability[0] = true
		availability[1] = true
		availability[2] = true
		availability[3] = true 




func spawn_new():
	print("works spawn new function")
	check_filled_slots()
	
	var rand_num = round(randf_range(0, 15))
	var rand_rare = round(randf_range(1,4))
	
	var loop_destroyer_2000 = 0
	
	while true:
		
		if int(rand_num) in filled:
			rand_num = round(randf_range(-0.5, 15.4))
			loop_destroyer_2000 += 1
			if loop_destroyer_2000 == 20000:
				#Häviö
				break
		else:
			loop_destroyer_2000 = 0
			print(rand_num)
			if rand_rare == 4:
				grid[rand_num] = 2
			else:
				grid[rand_num] = 1
			break
	
	visualize()


func check_filled_slots():
	
	filled = []
	
	for i in grid.size():
		
		if grid[i] > 0:
			filled.append(i)
	
	print(filled)


func visualize():
	check_filled_slots()
	
	reverse_summon()
	
	for i in filled.size():
		#print("visualize loop works" + " " + str(i))
		#print($Node2D.get_child(i))
		match grid[filled[i]]:
			1:
				summon(filled[i], first)
			2:
				summon(filled[i], second)
			3:
				summon(filled[i], third)
			4:
				summon(filled[i], fourth)
			5:
				summon(filled[i], fifth)
			6:
				summon(filled[i], sixth)


func print_grid():
	print(grid[0]," ",grid[1], " ", grid[2]," ",grid[3])
	print(grid[4]," ",grid[5], " ", grid[6]," ",grid[7])
	print(grid[8]," ",grid[9], " ", grid[10]," ",grid[11])
	print(grid[12]," ",grid[13], " ", grid[14]," ",grid[15])


func summon(order_num:int, type_of_block):
	var object = type_of_block.instantiate()
	object.global_position = $Node2D.get_child(order_num).global_position
	
	$blocks.add_child(object)

func reverse_summon():
	for child in $blocks.get_children():
		child.queue_free()

func _on_button_pressed() -> void:
	spawn_new()
	print_grid()
	
