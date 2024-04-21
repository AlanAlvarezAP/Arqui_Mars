# SECCION DE INSTRUCCIONES (.text)
.data
array_space: .space 16
coma:.asciiz ", "
endl: .asciiz "\n"
.text
.globl __start
__start:
la $s1, array_space 
addi $t1,$0,12
addi $s2,$0,4
sw $t1,0($s1)
addi $t1,$0,85
sw $t1,4($s1)
addi $t1,$0,12
sw $t1,8($s1)
addi $t1,$0,1
sw $t1,12($s1)


li $v0, 1
lw $a0, 0($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1   
lw $a0, 4($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1     
lw $a0, 8($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1     
lw $a0, 12($s1) 
syscall
la $a0,endl 
li $v0,4
syscall


lw $t0,0($s1)
addi $t1,$zero,0
loop: add $t1,$t1,1
beq $t1,$s2,ini
add $t2,$t1,$t1
add $t2,$t2,$t2
add $t2,$t2,$s1
lw $t3,0($t2)
slt $t4,$t0,$t3
beq $t4,$zero,loop
addi $t0,$t3,0
j loop


#  i = t7
#  j= t6
#  min= t1
# n = s2
ini:
addi $t7,$t7,0
loop3:
beq $t7,$s2,fin
add $t1,$t7,$zero
addi $t6,$t7,1
loop4:
beq $t6,$s2,sal_in
mul $t8,$t6,4
mul $t9,$t1,4
lw $t4,array_space($t8)
lw $t5,array_space($t9)
blt $t4,$t5,swap
addi $t6,$t6,1
j loop4
swap:
move $t1,$t6
addi $t6,$t6,1
j loop4
sal_in:
mul $t8,$t1,4
mul $t9,$t7,4
lw $t4, array_space($t8)
lw $t5, array_space($t9)
sw $t4, array_space($t9)
sw $t5, array_space($t8)
addi $t7,$t7,1
li $t6,0
j loop3

fin:   
li $v0, 1
lw $a0, 0($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1   
lw $a0, 4($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1     
lw $a0, 8($s1)
syscall
li $v0,4
la $a0,coma
syscall
li $v0, 1     
lw $a0, 12($s1) 
syscall
la $a0,endl 
li $v0,4
syscall
li $v0, 1
la $a0, 0($t0)
syscall
li $v0, 10 
syscall
