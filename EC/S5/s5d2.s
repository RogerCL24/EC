	.data	
V1:     .space  64
M:      .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
V2:     .word   -5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10

	.text
	.globl main
main:
        move    $t0, $zero			# $t0  = k
        li      $t1, 4				
fork:	
	bge 	$t0, $t1, fi_fork
	move 	$t3, $zero			# $t3 = i
	li 	$t2, 16		
fori:
	bge 	$t3, $t2, fi_fori
	move 	$t5 $zero			# $t5 = temp
	move 	$t6, $zero			# $t6 = j
forj:
	bge	$t6, $t1, fi_forj		
	sll 	$t7, $t0, 2			# [4*k + j]
	addu 	$t7, $t6, $t7
	
	la 	$s0, M
	sll 	$s2, $t3, 4			# [i]
	addu 	$s2, $s2, $t7			# [i][4*k + j]
	sll 	$s2, $s2, 2			
	addu 	$s0, $s0, $s2			# M[i][4*k + j]
	lw 	$s0, 0($s0)			
	
	la 	$s1, V2			
	sll 	$s3, $t7, 2
	addu 	$s1, $s3, $s1
	lw 	$s1, 0($s1)
	mult 	$s0, $s1
	mflo 	$s0
	addu 	$t5, $t5, $s0
	
	addiu 	$t6, $t6, 1
	b 	forj
fi_forj:
	la 	$s4, V1
	sll 	$s5, $t3, 2
	addu 	$s4, $s5, $s4
	lw 	$s6, 0($s4)
	addu 	$s6, $s6, $t5
	sw 	$s6, 0($s4)
	addiu 	$t3, $t3, 1
	b 	fori
fi_fori:
	addiu 	$t0, $t0, 1
	b 	fork
fi_fork:
	jr	$ra
	
	
	
	 	
	
	
	


