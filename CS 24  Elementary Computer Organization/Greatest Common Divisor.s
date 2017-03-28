################################################################################
# Vladoi Marian
# Cs 24 
# Assignment 4
# This program finds  the Greatest Common Divisor of two integers using a 
# recursive function that implements Euclid's GCD 
################################################################################





.data
my_greet:	.asciiz "Welcome to the Euclid's GCD algorithm!\n\n"
my_firstInput:	.asciiz "Please input the first integer:  "
my_secondInput:	.asciiz "Please input the second integer: "
my_GDC:		.asciiz "The Greatest Common Divisor is: " 
CR:		.asciiz "\n"
my_bye:		.asciiz "\nThank you for playing!\n"




.text
.globl main

main:	

                #Printing the greeting message
		li	$v0, 4			 
		la	$a0, my_greet
		syscall
		
		#Printing new line \n
		li	$v0, 4
		la	$a0, CR
		syscall
		
		
		
		
		#Printing my_firstInput message
		li	$v0, 4
		la	$a0, my_firstInput
		syscall
							
		#Read  first integer (into v0)
		li	$v0, 5
		syscall
									
		# $s0 = <STDIN>  First integer
		move	$s0,$v0
		
		
		
		
		#Printing my_secondInput message
		li	$v0, 4
		la	$a0, my_secondInput
		syscall
											
		#Read  second integer (into v0)
		li	$v0, 5
		syscall
														
		# $s1 = <STDIN>  Second integer
		move	$s1, $v0
		
		
	
	
		# Set the parameters for the function call
		move	$a0, $s0
		move	$a1, $s1
		
	
	
		#Function call
		jal euclids_GCD
		
		
	
	
		#Move the return value of the function in $s2
		add	 $s2, $zero, $v1
		
	
	
		#Printing my_GDC message
		li	$v0, 4
		la	$a0, my_GDC
		syscall
		
		#Printing the greatest commmon divisor
		li	$v0, 1
		add	$a0, $zero, $s2
		syscall
				
		#Printing new line \n
		li	$v0, 4
		la	$a0, CR
		syscall
		
		
		
		
		#Printing the bye message		
		li	$v0, 4		
		la	$a0, my_bye
		syscall
				
				
				
				
				
		#Terminate the program
		li	$v0, 10			
		syscall


####################################################################################################################







######################################################################################################################
# Function that finds the Greatest Common Divisor of two integers
# Parameters : the 2 integers inputed by the user
# Return the Greatest Common Divisor of the two parameters
######################################################################################################################


euclids_GCD:

	#Save $ra, $a0, $a1 on the stack

	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$a1, 4($sp)
	sw	$a0, 0($sp)
	
	
	
	# If $a1 == 0 return $a0	
	bne	$a1, $zero, ELSE
	move	$v1, $a0
	addi	$sp, $sp, 12
	jr	$ra
	
	
	
ELSE:
	#Else return euclids_GCD($a1, $a0%$a1)
	divu	$a0, $a1
	mfhi	$t0
	move	$a0, $a1
	move	$a1, $t0
	jal	euclids_GCD
	
	
	
	
	
	#Restore the old return adress and old arguments along with stack pointer
	lw	$a0, 0($sp)
	lw	$a1, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra
	
	
	
	
#####################################################################################################################	