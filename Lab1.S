.data
N:
.word 4
M:
.word 4
matrix:
.word 1, 1, 2, 3
.word 2, 2, 3, 4
.word 3, 3, 4, 5
.word 5, 4, 5, -6
sum:
.word 0
column_index:
.word 3

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, column_index
la a6, sum

call process
la a2, sum
call print
call exit

process:
lw t0, 0(a2)     # t0 = N 
lw t1, 0(a3)     # t1 = M 
lw t2, 0(a5)
    
addi t3, zero, 0
addi t4, zero, 0

slli t5, t2, 2   # t5 = column_index * 4

cycle:
slli t6, t3, 4   # t6 = i * 16
add t6, t6, t5
add t6, a4, t6
    
lw t6, 0(t6)
add t4, t4, t6

addi t3, t3, 1
blt t3, t0, cycle

sw t4, 0(a6)
ret

exit:
addi a0, x0, 10
ecall


print:
lw t1, 0(a2)

addi a0, x0, 1 # print_int ecall - печать числа
lw a1, 0(a2)
ecall
ret