#*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
# COGNOM1: Londres
# COGNOM2: Cot
# NOM: Roger
#*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*

.data

MAT: .word   9, -1, -3, -2,
             1, -6,  9, 12,
            15,  2,  8,  2,
            19,  6, -2,  3

.text
.globl main

main:

	li	$t0, 0	#$t0 = i
	la 	$t6, MAT
	li	$t8, 3
fori:
	li	$t2, 4
	bge	$t0, $t2, fifori
	li	$t1, 3  #$t1 = j
	addiu	$t4, $t0, -1
forj:
	ble	$t1, $t4, fiforj
	sll	$t5, $t0, 2	#i * NC
	addu	$t5, $t5, $t1	#i* NC + j
	sll	$t5, $t5, 2	#T * (NC * i + j)
	addu	$t5, $t5, $t6	#@MAT[i][j]
	lw	$t7, 0($t5)	#Mat[i][j]
	div	$t7, $t8
	mfhi	$t2
	sll	$t5, $t1, 2	#j * NC
	addu	$t5, $t5, $t0	#j* NC + i
	sll	$t5, $t5, 2	#T * (NC * j + i)
	addu	$t5, $t5, $t6	#@MAT[j][i]
	beq	$t2, $zero, else
	lw	$t9, 0($t5)	#Mat[j][i]
	and	$t2, $t9, $t7	#temp = 
	b 	fielse
else:
	li      $t2, 17
	mult	$t7, $t2
	mflo	$t2
fielse:
	sw 	$t2, 0($t5)
	addiu 	$t1, $t1, -1	#--j
	b 	forj
fiforj:
	addiu 	$t0, $t0, 1	#++i
	b fori
	
fifori:
        jr  $ra 

