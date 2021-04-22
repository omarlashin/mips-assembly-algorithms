.data
space: .asciiz " "
newline: .asciiz "\n"
A: .word 3 10 7 1 9 6 4 2 8 5

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
addi $t1,$0,1
for1tst:
slt $t0,$t1,$a1
beq $t0,$0,exit1
sll $t2,$t1,2
add $t2,$t2,$a0
lw $t2,0($t2)
addi $t3,$t1,-1
for2tst:
slt $t0,$t3,$0
bne $t0,$0,exit2
sll $t4,$t3,2
add $t4,$t4,$a0
lw $t5,0($t4)
slt $t0,$t2,$t5
beq $t0,$0,exit2
sw $t5,4($t4)
addi $t3,$t3,-1
j for2tst
exit2:
addi $t6,$t3,1
sll $t6,$t6,2
add $t6,$t6,$a0
sw $t2,0($t6)
addi $t1,$t1,1
j for1tst
exit1:
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
