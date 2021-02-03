	.data
error:

	.string "Error Occured"
	
	.text
	
	.macro cin (%x) 
	li a7,5
	ecall
	mv %x,a0
	.end_macro
	
	
	.macro cout (%x)
	li a7,1
	mv a0,%x
	ecall
	li a7,11
	li a0,'\n'
	ecall
	.end_macro 
	
	
	.macro throw_error
	la a0,error
	li a7, 4
	ecall
	.end_macro 
	
	
	.macro power(%x,%y)
	
	li t2,0
	mv t3,%x
	mv t4,%y
	beq t2,t4,zero_case
	
	loop:
	
	addi t2,t2,1
	beq t2,%y,loop_end
	mv t4,%x
	mul %x,%x,t3
	#overflow сheck:
	mv t6,%x
	div t5,t6,t3
	blt t5,t4,overflow
	j loop
	
	zero_case:
	
	li %x,1
	j loop_end
	
	overflow:
	
	throw_error
	
	loop_end:
	
	.end_macro 

main:

	cin(t0)
	cin(t1)
	power(t0,t1)
	cout(t0)
	