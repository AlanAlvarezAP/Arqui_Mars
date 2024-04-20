# SECCION DE INSTRUCCIONES (.text)
.data
array_space: .space 16
coma:.asciiz ", "
endl: .asciiz "\n"
.text
.globl __start
__start:
la $s1, array_space 
addi $t1,$0,32
addi $s2,$0,4
sw $t1,0($s1)
addi $t1,$0,85
sw $t1,4($s1)
addi $t1,$0,12
sw $t1,8($s1)
addi $t1,$0,50
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
ini:
addi $t6,$s2,0
mul $t6,$t6,$t6
sub  $t6,$t6,$s2
div $t6,$t6,2
addi $t7,$t7,0
conta:
addi $t7,$t7,1
beq $t7,$t6,fin
done:
addi $t1,$zero,0
loop2: add $t1,$t1,1
beq $t1,$s2,conta
add $t2,$t1,$t1
add $t2,$t2,$t2
add $t2,$t2,$s1
lw $t3,-4($t2)
lw $t5,0($t2)
slt $t4,$t5,$t3
beq $t4,$zero,loop2
sw  $t5, -4($t2)
sw  $t3, 0($t2)
j loop2
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
