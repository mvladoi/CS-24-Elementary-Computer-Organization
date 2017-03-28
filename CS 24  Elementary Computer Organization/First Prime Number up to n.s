################################################################################
# Vladoi Marian
# Cs 24 
# Assignment 3
# This program compute and print the first prime numbers up to n 
################################################################################





.data
my_greet:	.asciiz "Welcome to the prime integers program!\n\n"
my_prompt:	.asciiz "How many primes (n >= 1): "
CR:		.asciiz "\n"
my_bye:		.asciiz "\nThank you for playing!\n"


.text
.globl main

main:		
   
   		#Printing the greeting message
		li	$v0, 4			 
		la	$a0, my_greet
		syscall
		
		
		#Printing the prompt message
		li	$v0, 4
		la	$a0, my_prompt
		syscall
		
		
		
		#Read integer (into v0)
		li	$v0, 5
		syscall
			
			
				
		# $s0 = <STDIN> integer
		add	$s0, $zero, $v0
		
		
		
		#Initialize $s1 = 1, register that contains the 
		# the values that are tested for prime
		addi	$s1, $zero, 1 
		
		#Initialize $s3 = 0, register that contains the index of the loop
		add	$s3, $zero, $zero
		
		
		#If user input is less than 1, exit the program
		slti	$t0, $s0, 1
		bne	$t0, $zero, done
		
		
loop: 

		#Check loop condition
		slt	$t0, $s3, $s0
		beq	$t0, $zero, done 
		
		
		#Increment the value
		addi	$s1, $s1, 1	
		
		
		#Move the value into the parameter register
		add	$a0, $s1, $zero
		
		
		#Function call
		jal	test_prime
		
		
		
		add	$s2, $zero, $v0
		beq	$s2, $zero, exit 
		
		#Printing the integer of integers
		li	$v0, 1
		add	$a0, $zero, $s1
		syscall
		
		
		#Printing new line \n
		li	$v0, 4
		la	$a0, CR
		syscall
		 
		 
		#Increment $s3
		addi	$s3, $s3, 1 
				 
		 
exit:		 
		 
		 
		#Next loop iteration
		j	loop
		
		
		
		
		
		
		
done:
		
		#Printing the bye message		
		li	$v0, 4		
		la	$a0, my_bye
		syscall
		
		
		
		#Terminate the program
		li	$v0, 10			
		syscall
		
######################################################################################################################		



		
		


		
#####################################################################################################################		
# Function that test if a number is prime
# If the number is prime return true, else return false
#####################################################################################################################

test_prime:	

		
 		add	$t0, $zero, $a0  # this is the number
 		addi	$t1, $zero, 2    # this is divisor
 		div 	$t2, $t0, $t1  # This is prime / divisor
 		
 loop2:		sle	$t3, $t1, $t2
 		beq	$t3, $zero, exit2
 		
 		 
		remu	$t4, $t0, $t1
		beq	$t4,$zero  return_false
		addi	$t1, $t1, 1
		j	loop2
		
		
return_false:
                 add	$v0, $zero, $zero #Return 0, not prime
                 jr	$ra
		
exit2:
		addi	$v0, $zero, 1     # Return 1, prime
   		jr	$ra
   		
######################################################################################################################   		