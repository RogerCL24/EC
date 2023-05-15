	.data
result: .word 0
num:	.byte ';'

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI
	la $t2, result
	la $t0, num
	lb $t0, 0($t0)
	li $t1, 0x41
	blt $t0, $t1, else
	addiu $t1, $t1, 25
	ble $t0, $t1, save_char
	addiu $t1, $t1, 7
	blt $t0, $t1, else
	addiu $t1, $t1, 25
	bgt $t0, $t1, else
save_char:
	sw $t0, 0($t2)
	b write
else :
	li $t1, 0x30
	blt $t0, $t1, cond
	addiu $t1, $t1, 9
	bgt $t0, $t1, cond
	addiu $t0, $t0, -48
	sw $t0, 0($t2)
	b write
cond:
	li $t0, -1
	sw $t0, 0($t2)
write:
	lw $t2, 0($t2)
	li $v0, 1
	move $a0, $t2
	syscall








	jr $ra

