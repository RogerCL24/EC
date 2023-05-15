	.data
	.align 2
fib: 	.space 40
	
	.text
	.globl main
main:
	li $s0, 2
	la $t1, fib
	sw $zero, 0($t1)
	li $t2, 1
	sw $t2, 4($t1)
while:
	slti $t0, $s0, 10
	beq $t0, $zero, fi
	sll $t2, $s0, 2
	addu $t5, $t1, $t2
	lw $t3, -4($t5)
	lw $t4, -8($t5)
	addu $t3, $t3, $t4
	sw $t3, 0($t5)
	addiu $s0, $s0, 1
	b while
fi: 
	jr $ra
