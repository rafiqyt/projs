# File:		Puzzle.asm
# Author:	R. Tucker
#
# Description:	puzzle board game in MIPS.
#
# Revisions:	$Log$


	.data
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
println: 	.asciiz "\n"
welcome_msg1:	.ascii	"*************************\n"
welcome_msg2:	.ascii	"**      Tile Puzzle    **\n"
welcome_msg3:	.asciiz	"*************************\n"
board_size:	.asciiz "Enter the size of the board: "
values1:	.ascii	"Begin entering the initial values on the tiles."
values2:	.ascii	" Start in the upper\nleft corner, and enter the tiles"
values3:	.asciiz	" from left - right, top - bottom.\n\r"
enter_move:	.asciiz	"Enter move (1=up, 2=down, 3=left, 4=right, -1=quit): "
board_size_err:	.asciiz	"Error, board size must be greater than one.\n"
value_err1:	.asciiz	"Error, more than one empty spot in the puzzle."
value_err2:	.asciiz	"Error, no empty spot in the puzzle."
value_err3:	.asciiz	"Error, numbers must be in range -128 - 127"
move_err1:	.asciiz	"Illegal move, not a legal move value."
move_err2:	.asciiz	"Illegal move, no tile can move in that direction."
quit_msg:	.asciiz	"You have quit"
win_msg1:	.ascii	"*************************\n"
win_msg2:	.ascii	"**    You have won!    **\n"
win_msg3:	.asciiz	"*************************\n"


	.align 2
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
board:		.word	0:16	# Make sure to change hardcoded value
len_of_board:	.word	4	# Make sure to change hardcoded value
size_of_board:	.word	16	# Make sure to change hardcoded value
blank:		.word	-1	# The location in the array for the empty value is stored here

	.text
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Name:		main
#
# Description:	This is the main of the Tile puzzle program.
#		Prints out all of the opening text, collects the starting input
#		then calls for the puzzle to be built
#
# Arguments:	none
#
# Returns:	none
<<<<<<< HEAD
#
=======
#	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
main:
	li	$v0,4
	la	$a0,println
	syscall
<<<<<<< HEAD

	li	$v0,4
	la	$a0,welcome_msg1
	syscall

	li	$v0,4
	la	$a0,println
	syscall

	li	$v0,4
	la	$a0,board_size
	syscall

	li	$v0,5
	syscall

=======
	
	li	$v0,4
	la	$a0,welcome_msg1
	syscall
	
	li	$v0,4
	la	$a0,println
	syscall
	
	li	$v0,4
	la	$a0,board_size
	syscall
	
	li	$v0,5
	syscall
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	move	$t9,$v0
	li	$a0,2			# Checks to make sure the board size is > 1
	slt	$t1,$v0,$a0
	li	$t2,1
	beq	$t1,$t2,illegal_board	# Terminates the game if it is not
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	li	$v0,4
	la	$a0,println
	syscall

	li	$v0,4
	la	$a0,values1
	syscall
<<<<<<< HEAD

	mult	$t9,$t9			# Square to the board size
	mflo	$t9

	li	$t8,0			# Counter used to store the blanks initial position
	la	$a1,board

=======
	
	mult	$t9,$t9			# Square to the board size
	mflo	$t9
	
	li	$t8,0			# Counter used to store the blanks initial position
	la	$a1,board
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
number_input_loop:
	beq	$t9,$zero,is_blank_set
	li	$v0,5
	syscall
<<<<<<< HEAD

	li	$t0,-128
	li	$t1,127

	slt	$t2,$v0,$t0
	bne	$t2,$zero,illegal_number

	slt	$t2,$t1,$v0
	bne	$t2,$zero,illegal_number

	beq	$v0,$zero,set_blank

	sw	$v0,0($a1)

=======
	
	li	$t0,-128
	li	$t1,127
	
	slt	$t2,$v0,$t0
	bne	$t2,$zero,illegal_number
	
	slt	$t2,$t1,$v0
	bne	$t2,$zero,illegal_number
	
	beq	$v0,$zero,set_blank
	
	sw	$v0,0($a1)
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	addi	$a1,$a1,4
	addi	$t8,$t8,1
	addi	$t9,$t9,-1
	j	number_input_loop
<<<<<<< HEAD


=======
	
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Name:		set_blank
#
# Description:	Checks if the blank already has  position set in the current board.
#		Errors out if it does, stores the current position otherwise.
#
# Arguments:	none
#
# Returns:	none
#
set_blank:
	la	$t0,blank
	lw	$t1,0($t0)		# Get the current number stored in the blank memory location
<<<<<<< HEAD

	slt	$t1,$t1,$zero		# If $t0 > 0 then the blank has already been set
	beq	$t1,$zero,blank_set	# and we should error out then

	sw	$t8,0($t0)
	sw	$v0,0($a1)

=======
	
	slt	$t1,$t1,$zero		# If $t0 > 0 then the blank has already been set
	beq	$t1,$zero,blank_set	# and we should error out then
	
	sw	$t8,0($t0)
	sw	$v0,0($a1)
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	addi	$a1,$a1,4
	addi	$t8,$t8,1
	addi	$t9,$t9,-1
	j	number_input_loop
<<<<<<< HEAD


=======
	
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Name:		blank_set
#
# Description:	Called when the user sets two blank positions. Print out the blank error message
#		then exits
#
# Arguments:	none
#
# Returns:	none
#
blank_set:
	li	$v0,4
	la	$a0,value_err1
	syscall
<<<<<<< HEAD

	li	$v0,10
	syscall

=======
	
	li	$v0,10
	syscall
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Name:		is_blank_set
#
# Description:	Called after the user enters all board number to ensure a blank was set.
#		Print out the board if it is set, errors out otherwise
#		then exits
#
# Arguments:	none
#
# Returns:	none
#
is_blank_set:
	la	$t0,blank
	lw	$t0,0($t0)
	slt	$t1,$t0,$zero
<<<<<<< HEAD

	beq	$t1,$zero,print_board
=======
	
	beq	$t0,$zero,print_board
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae

	li	$v0,4
	la	$a0,value_err2
	syscall
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	li	$v0,10
	syscall

#
# Name:		print_board
#
# Description:	Prints the boards current configuraton
#
# Arguments:	none
#
# Returns:	none
#

print_board:
	la	$t1,board
	la	$t2,size_of_board
	lw	$t2,0($t2)
	li	$t3,0
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
print_loop:
	beq	$t3,$t2,input_move

	lw	$a0,0($t1)
	li	$v0,1
	syscall
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	addi	$t3,$t3,1
	addi	$t1,$t1,4
	j	print_loop


#
# Name:		input_move
#
# Description:	Request the user to input a move
#
# Arguments:	none
#
# Returns:	none
#
input_move:
	li	$v0,4
	la	$a0,println
	syscall

	li	$v0,4
	la	$a0,enter_move
	syscall
<<<<<<< HEAD

	li	$v0,5
	syscall

=======
	
	li	$v0,5
	syscall
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	move	$t1,$v0
	li	$t2,-1
	li	$t3,1
	li	$t4,2
	li	$t5,3
	li	$t6,4
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	beq	$t1,$t2,quit
	beq	$t1,$t3,move_up
	beq	$t1,$t4,move_down
	beq	$t1,$t5,move_left
	beq	$t1,$t6,move_right
<<<<<<< HEAD

	j	illegal_move

=======
	
	j	illegal_move
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae

#
# Name:		move_up
#
<<<<<<< HEAD
# Description:
=======
# Description:	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
#
<<<<<<< HEAD
move_up:
=======
move_up:	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	j	print_board

#
# Name:		move_down
#
<<<<<<< HEAD
# Description:
=======
# Description:	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
#
move_down:
	j	print_board

#
# Name:		move_left
#
<<<<<<< HEAD
# Description:
=======
# Description:	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
#
move_left:
	j	print_board

#
# Name:		move_right
#
<<<<<<< HEAD
# Description:
=======
# Description:	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
#
move_right:
	j	print_board



#
# Name:		illegal_number
#
# Description:	User has entered an illegal number. prints the illegal number
#		message then terminates
#
# Arguments:	none
#
# Returns:	none
<<<<<<< HEAD
#
=======
#		
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
illegal_number:
	li	$v0,4			# Loads and prints the board error message
	la	$a0,value_err3
	syscall
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	li	$v0,10			# Exits the program
	syscall


#
# Name:		illegal_board
#
# Description:	User has entered an illegal board. prints the illegal board
#		message then terminates
#
# Arguments:	none
#
# Returns:	none
<<<<<<< HEAD
#
=======
#		
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
illegal_board:
	li	$v0,4			# Loads and prints the board error message
	la	$a0,board_size_err
	syscall
<<<<<<< HEAD

	li	$v0,10			# Exits the program
	syscall

=======
	
	li	$v0,10			# Exits the program
	syscall
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae

#
# Name:		illegal_move
#
# Description:	User has entered an illegal move. prints the illegal move
<<<<<<< HEAD
#		message then prompts for a new legal move.
=======
#		message then prompts for a new legal move 
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
<<<<<<< HEAD
#
=======
#		
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
illegal_move:
	li	$v0,4		# Loads and prints out move_err1
	la	$a0,move_err1
	syscall
<<<<<<< HEAD

=======
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
	j	input_move	# Jumps back to input_move to get a new move
#
# Name:		invalid_move
#
# Description:	User has entered and invalid move. prints the invalid move
<<<<<<< HEAD
#		message then prompts for a new valid move.
=======
#		message then prompts for a new valid move 
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Arguments:	none
#
# Returns:	none
#
invalid_move:
	li	$v0,4		# Loads and prints out move_err2
	la	$a0,move_err2
	syscall
<<<<<<< HEAD

	j	input_move	# jumps back to input_move to get a new move

=======
	
	j	input_move	# jumps back to input_move to get a new move
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
#
# Name:		win
#
# Description:	User has won the game. prints the winning messege
#		then exits
#
# Arguments:	none
#
# Returns:	none
<<<<<<< HEAD
#
=======
#	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
win:
	li	$v0,4
	la	$a0,println
	syscall
<<<<<<< HEAD

	li	$v0,4
	la	$a0,win_msg1
	syscall

	li	$v0,10
	syscall
=======
	
	li	$v0,4
	la	$a0,win_msg1
	syscall
	
	li	$v0,10
	syscall	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae


#
# Name:		quit
#
# Description:	User has decided to quit the game. prints the quit messege
#		then exits
#
# Arguments:	none
#
# Returns:	none
#
quit:
	li	$v0,4
	la	$a0,println
	syscall
<<<<<<< HEAD

	li	$v0,4
	la	$a0,quit_msg
	syscall

	li	$v0,10
	syscall


=======
	
	li	$v0,4
	la	$a0,quit_msg
	syscall
	
	li	$v0,10
	syscall
	
>>>>>>> 7c2cc6d06df35e91ad482b8548cf54a5db8249ae
