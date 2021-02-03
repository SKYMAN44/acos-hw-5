	.macro divide_unsigned (%x,%y)
	li t2,0
	mv t3,%x
	
	while:
	
	bltu  t3,%y, end_while
	addi t2,t2,1
	sub t3,t3,%y
	j while
	
	end_while:
	
	mv %x,t2
	mv %y,t3
	
	.end_macro 
	
	
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
	
main:
	
	cin(t0)
	cin(t1)
	divide_unsigned(t0,t1)
	cout(t0)
	cout(t1)
	
	
