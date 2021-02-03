
	.text
main:

	# x: t0 = readInt()
     	li a7, 5
	ecall
	mv t0, a0
	
	# y: t1 = readInt()
     	li a7, 5
	ecall
	mv t1, a0
	
	# t1 - min
	blt t1, t0, branch1
	
	# t0 min
	blt t0, t1, branch2
	ecall

branch1:
	
	mv t3,t1
	mv t4,t0
	b  for

branch2:
	
	mv t3,t0
	mv t4,t1
	b  for
for:

	addi t4,t4,1
next:

   	beq  t3, t4, end_for
   	mv   a0, t3
   	li   a7, 1
   	ecall
   	li   a7, 11
   	li   a0, '\n'
   	ecall
   	addi t3, t3, 1
   	j    next
end_for:
	

	