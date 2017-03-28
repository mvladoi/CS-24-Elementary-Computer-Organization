
################################################################################
# Vladoi Marian
# Cs 24 Assignment 2
# This program repeatedly inputs integers and adds them into a running sum
# Extra credit: printing the average value as an integer
################################################################################





.data
my_greet:	.asciiz "Welcome to the calculating integers sum program!\n\n"
my_prompt:	.asciiz "Please enter the numbers (0 to quit): "
my_sum:		.asciiz " is the sum of your integers. \n"
my_average:	.asciiz " is the average value of integers. \n"
CR:		.asciiz "\n"
my_bye:		.asciiz "\nThank you for playing!\n"


.text
.globl main

main:		
   
   		#Printing the greeting message
		li	$v0, 4			 
		la	$a0, my_greet
		syscall
		
		
		#Initialize $s0 = 0, register that will contains the sum
		add	$s0, $zero, $zero
		
		#Initialize $s1=0, register that containes the number of integers
		add	$s1, $zero, $zero
		
		
loop:		
 		#Printing the prompt message
		li	$v0, 4
		la	$a0, my_prompt
		syscall
		
		
		#Read integer (into v0)
		li	$v0, 5
		syscall
		
		
		# $a0 = <STDIN> integer
		add	$a0, $zero, $v0
		
		
		#Programe done if input is 0
		beq	$a0, $zero, done
		
		
		#Calculating the sum of integers
		add	$s0, $s0, $a0
		addi	$s1, $s1, 1
		
		
		#Next loop iteration
		j	loop
		
		
		
		
		
		
done:		
		#Calculating the average of integers
		div	$s0, $s1
		
		#Taking the result from Lo (s3 = Lo = average value)
		mflo	$s3
		
		#Printing new line \n
		li	$v0, 4
		la	$a0, CR
		syscall
		
		
		#Printing the sum of integers
		li	$v0, 1
		add	$a0, $zero, $s0
		syscall
		li	$v0, 4
		la	$a0, my_sum
		syscall
		
		
		#Printing the average value of integers
		li	$v0, 1
		add	$a0, $zero, $s3
		syscall
		li	$v0, 4
		la	$a0, my_average
		syscall
		
		
		#Printing the bye message		
		li	$v0, 4		
		la	$a0, my_bye
		syscall
		
		
		#Terminate the program
		li	$v0, 10			
		syscall