	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0
	
resultat: .word 0
	.text 
	.globl main
main:
# Escriu aqui el teu codi del main
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, mat
	jal suma_col
	la $t0, resultat
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

suma_col:
# Escriu aqui el teu codi de la subrutina
	li $t0, 0	#i = 0
	addiu $t1, $a0, 8 #*p = @mat[0][2]
	li $t2, 4
for:	bge $t0, $t2, endfor
	lw $t3, 0($t1)
	addu $v0, $v0, $t3
	addiu $t1, $t1, 24
	addiu $t0, $t0, 1
	b for
endfor:
	jr $ra


