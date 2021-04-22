.text
MAIN:
addi $a0,$0,0
jal fibonacci
move $a0,$v0
addi $v0,$0,1
syscall
addi $v0,$0,10
syscall

fibonacci:
addi $sp,$sp,-8
sw $ra,4($sp)
sw $a0,0($sp)
bne $a0,$0,check2
move $v0,$0
addi $sp,$sp,8
jr $ra
check2:
addi $t0,$0,1
bne $a0,$t0,else
move $v0,$t0
addi $sp,$sp,8
jr $ra
else:
addi $a0,$a0,-1
jal fibonacci
lw $a0,0($sp)
addi $sp,$sp,-4
sw $v0,0($sp)
addi $a0,$a0,-2
jal fibonacci
lw $t1,0($sp)
addi $sp,$sp,4
add $v0,$v0,$t1
lw $a0,0($sp)
lw $ra,4($sp)
addi $sp,$sp,8
jr $ra