	.data 
cadena:	.byte -1,-1,-1,-1,-1,-1
vec:	.word 5, 6, 8, 9, 1
	
	.text
	.globl main
main:
	li $s0, 0
while:
	li $t0, 5
	bge $s0, $t0, fi
	la $t0, vec
	sll $t1, $s0, 2
	li $t2, 4
	sll $t2, $t2, 2
	subu $t3, $t2, $t1
	addu $t4, $t3, $t0
	lw $t4, 0($t4)
	addiu $t4, $t4, 48
	la $t5, cadena
	addu $t5, $t5, $s0
	sb $t4, 0($t5)
	addiu $s0, $s0, 1
	b while
fi:
	sb $zero, 1($t5)
	li $v0, 4
	la $a0, cadena
	syscall
	jr $ra