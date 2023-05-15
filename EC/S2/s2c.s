	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -60 
	sw $s0, 40($sp) 
	sw $s1, 44($sp) 
	sw $s2, 48($sp)
	sw $s3, 52($sp) 
	sw $ra, 56($sp)

	move $s0, $a0 #*vec
	move $s1, $a1 #num
	move $s2, $zero # k=0
	li $t0, 10
	addu $t1, $sp, $zero
foru:
	bge $s2, $t0, fi_foru
	sw $zero, 0($t1)
	addiu $t1, $t1, 4
	addiu $s2, $s2, 1
	b foru
fi_foru:
	li $s3, 48 # max = '0'
	move $s2, $zero # k=0
fordos:
	bge $s2, $s1, fi_fordos #vete si k >= num
	move $a0, $sp
	addu $t1, $s0, $s2 # @vec[k]
	lb $t1, 0($t1) # vec[k]
	addiu $a1, $t1, -48
	addiu $a2, $s3, -48
	jal update
	addiu $s3, $v0, 48 # max='0' + update()
	addiu $s2, $s2, 1 # ++k
	b fordos
fi_fordos:
	move $v0, $s3 #return max
	lw $s0, 40($sp) 
	lw $s1, 44($sp) 
	lw $s2, 48($sp)
	lw $s3, 52($sp) 
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	jr $ra

update:
# ESCRIU AQUI EL TEU CODI
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	move $s0, $a0 # *h
	move $s1, $a1 # i
	move $s2, $a2 # imax

	jal nofares
	sll $t0, $s1, 2 # i*4
	addu $t1, $t0, $s0 #@h[i]
	lw $t0, 0($t1) #h[i]
	addiu $t0, $t0, 1 #++h[i]
	sw $t0, 0($t1)

	sll $t2, $s2, 2
	addu $t2, $t2, $s0 # @h[imax]
	lw $t2, 0($t2)
	ble $t0, $t2, else # ve si h[i] <= h[imax]
	move $v0, $s1 #return i
	b fi
else:
	move $v0, $s2
fi:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	jr $ra



