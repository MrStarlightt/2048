extends Node2D

var grid = [0, 0, 1, 2, 
			1, 1, 2, 2, 
			2, 0, 1, 1, 
			1, 1, 0, 1]

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

var direction = null

var i = 1

func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("up"):
		move_up()
	
	if Input.is_action_just_pressed("down"):
		move_down()
	
	if Input.is_action_just_pressed("right"):
		move_righ()
	
	if Input.is_action_just_pressed("left"):
		move_left()


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
				if grid[y_rows[i][0]] == grid[y_rows[i][2]]:
					grid[y_rows[i][0]] += 1
					grid[y_rows[i][2]] = 0
					
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
				if grid[y_rows[i][1]] == grid[y_rows[i][3]]:
					grid[y_rows[i][1]] += 1
					grid[y_rows[i][3]] = 0
				
				# slot 2 is empty
				elif grid[y_rows[i][1]] == 0:
					# slot 1 and 4 are same
					if grid[y_rows[i][0]] == grid[y_rows[i][3]]:
						grid[y_rows[i][0]] += 1
						grid[y_rows[i][3]] = 0
					
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
				
			# slot 2 is empty
			elif grid[y_rows[i][2]] == 0:
				# slot 1 and 3 are same
				if grid[y_rows[i][3]] == grid[y_rows[i][1]]:
					grid[y_rows[i][3]] += 1
					grid[y_rows[i][1]] = 0
					
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
				if grid[y_rows[i][2]] == grid[y_rows[i][0]]:
					grid[y_rows[i][2]] += 1
					grid[y_rows[i][0]] = 0
				
				# slot 2 is empty
				elif grid[y_rows[i][2]] == 0:
					# slot 1 and 4 are same
					if grid[y_rows[i][3]] == grid[y_rows[i][0]]:
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
				
			# slot 2 is empty
			elif grid[x_rows[i][2]] == 0:
				# slot 1 and 3 are same
				if grid[x_rows[i][3]] == grid[x_rows[i][1]]:
					grid[x_rows[i][3]] += 1
					grid[x_rows[i][1]] = 0
					
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
				if grid[x_rows[i][2]] == grid[x_rows[i][0]]:
					grid[x_rows[i][2]] += 1
					grid[x_rows[i][0]] = 0
				
				# slot 2 is empty
				elif grid[x_rows[i][2]] == 0:
					# slot 1 and 4 are same
					if grid[x_rows[i][3]] == grid[x_rows[i][0]]:
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
				
			# earliest empty
			elif grid[x_rows[i][0]] == 0:
				grid[x_rows[i][0]] = grid[x_rows[i][1]]
				grid[x_rows[i][1]] = 0
				
		
		
		
		
		## Third
		# check if the next slot is filled
		if x_rows[i][2] in filled: # is filled
			
			# slot 2 and 3 are same
			if grid[x_rows[i][1]] == grid[x_rows[i][2]]:
				grid[x_rows[i][1]] += 1
				grid[x_rows[i][2]] = 0
				
			# slot 2 is empty
			elif grid[x_rows[i][1]] == 0:
				# slot 1 and 3 are same
				if grid[x_rows[i][0]] == grid[x_rows[i][2]]:
					grid[x_rows[i][0]] += 1
					grid[x_rows[i][2]] = 0
					
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
				if grid[x_rows[i][1]] == grid[x_rows[i][3]]:
					grid[x_rows[i][1]] += 1
					grid[x_rows[i][3]] = 0
				
				# slot 2 is empty
				elif grid[x_rows[i][1]] == 0:
					# slot 1 and 4 are same
					if grid[x_rows[i][0]] == grid[x_rows[i][3]]:
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


func test():
	
	# check if the next slot is filled
	if y_rows[i][1] in filled: # is filled
		
		# earlier is the same type
		if grid[y_rows[i][1]] == grid[y_rows[i][1]]:
			grid[y_rows[i][0]] += 1
			grid[y_rows[i][1]] = 0
			
		# earliest empty
		elif y_rows[i][0] == y_rows[i][1]:
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
			if grid[y_rows[i][0]] == grid[y_rows[i][2]]:
				grid[y_rows[i][0]] += 1
				grid[y_rows[i][2]] = 0
				
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
			
			# slot 2 and 3 are same
			if grid[y_rows[i][1]] == grid[y_rows[i][3]]:
				grid[y_rows[i][1]] += 1
				grid[y_rows[i][3]] = 0
			
			# slot 2 is empty
			elif grid[y_rows[i][1]] == 0:
				# slot 1 and 4 are same
				if grid[y_rows[i][0]] == grid[y_rows[i][3]]:
					grid[y_rows[i][0]] += 1
					grid[y_rows[i][3]] = 0
				
				# slot 1 is empty
				elif grid[y_rows[i][0]] == 0:
					grid[y_rows[i][0]] = grid[y_rows[i][3]]
					grid[y_rows[i][3]] = 0
				
				else:
					
					grid[y_rows[i][1]] = grid[y_rows[i][3]]
					grid[y_rows[i][3]] = 0

func check_filled_slots():
	
	filled = []
	
	for i in grid.size():
		
		if grid[i] > 0:
			filled.append(i)
	
	print(filled)





func print_grid():
	print(grid[0]," ",grid[1], " ", grid[2]," ",grid[3])
	print(grid[4]," ",grid[5], " ", grid[6]," ",grid[7])
	print(grid[8]," ",grid[9], " ", grid[10]," ",grid[11])
	print(grid[12]," ",grid[13], " ", grid[14]," ",grid[15])


func _on_button_pressed() -> void:
	print_grid()
