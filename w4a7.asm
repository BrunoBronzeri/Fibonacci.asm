.text
	li $v0, 5
	syscall
	abs $t4, $v0
	
	bge $v0, 3, if_grtrEqual 
	ble $v0, 1, equal_one
	ble $v0, 2, equal_two
	
equal_one:
	li $a0, 0
	li $v0, 1
	syscall
	b end_program
	
equal_two:
	li $a0, 0
	li $v0, 1
	syscall
	li $a0, 1
	li $v0, 1
	syscall
	b end_program
	
if_grtrEqual:
	li $a0, 0
	abs $t1, $a0
	li $v0, 1
	syscall
	li $a0, 1
	abs $t2, $a0
	li $v0, 1
	syscall
	
	sub, $t4, $t4, 2
	
while_fibonacci:
	add $a0, $t1, $t2
	abs $t1, $t2
	abs $t2, $a0
	li $v0, 1
	syscall
	add $t3, $t3, 1
	blt $t3, $t4, while_fibonacci 

end_program:
	