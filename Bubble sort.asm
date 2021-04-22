.data
space: .asciiz " "
newline: .asciiz "\n"
A: .word 3 10 7 4 9 1 5 8 2 6

.text
MAIN:
la $a0,A
addi $a1,$0,10
jal print
la $a0,A
addi $a1,$0,10
jal sort
la $a0,A
addi $a1,$0,10
jal print
addi $v0,$0,10
syscall

sort:
addi $sp,$sp,-20
sw $ra,16($sp)
sw $s3,12($sp)
sw $s2,8($sp)
sw $s1,4($sp)
sw $s0,0($sp)
move $s2,$a0
move $s3,$a1
move $s0,$0
for1tst:
slt $t0,$s0,$s3
beq $t0,$0,exit1
addi $s1,$s0,-1
for2tst:
slt $t0,$s1,$0
bne $t0,$0,exit2
sll $t1,$s1,2
add $t2,$t1,$s2
lw $t3,0($t2)
lw $t4,4($t2)
slt $t0,$t4,$t3
beq $t0,$0,exit2
move $a0,$s2
move $a1,$s1
jal swap
addi $s1,$s1,-1
j for2tst
exit2:
addi $s0,$s0,1
j for1tst
exit1:
lw $s0,0($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $ra,16($sp)
addi $sp,$sp,20
jr $ra

swap:
sll $t1,$a1,2
add $t2,$t1,$a0
lw $t0,0($t2)
lw $t3,4($t2)
sw $t3,0($t2)
sw $t0,4($t2)
jr $ra

print:
move $t1,$a0
sll $t2,$a1,2
add $t2,$t2,$a0
test:
beq $t1,$t2,exit
addi $v0,$0,1
lw $a0,0($t1)
syscall
addi $v0,$0,4
la $a0,space
syscall
addi $t1,$t1,4
j test
exit:
addi $v0,$0,4
la $a0,newline
syscall
jr $ra
