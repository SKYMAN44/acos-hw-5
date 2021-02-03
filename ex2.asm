   	.data
   	
endprogms:

	.string "end of programm!"
	
checkf:

	.string "end of check"
	
array:
   	.word 32

	.text
for:
	
	mv  t0, zero
	addi t1,zero,32
	la t3, array

next:
	addi t3,t3,4
	beq t0, t1, end_for
	li  a7, 5
	ecall
	mv  t2, a0
	beq t2,zero, end_for
	sw t2,0(t3)
	addi t0, t0, 1
   	j    next
	
	
end_for:

	la a0,endprogms
	li a7, 4
	ecall
	li   a7, 11
   	li   a0, '\n'
   	ecall
	
	
#let's print what is saved inside array 
array_is_full:

	la t4, array
	addi t5,zero, 32
	addi t6,zero,0

loop:
   	addi t4, t4, 4
  	beq  t6, t5, done
  	addi t6,t6,1
    	lw   t2, (t4)
    	mv   a0,t2
    	li   a7,1
    	ecall
    	li   a7, 11
   	li   a0, '\n'
   	ecall
   	j loop
done:
	
	la a0,checkf
	li a7, 4
	ecall


	
	
