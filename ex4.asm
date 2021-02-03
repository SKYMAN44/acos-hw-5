	
	.macro print_hex (%x)
	li a7, 34
	mv a0, %x
	ecall
	.end_macro

	.macro print_hex_imm (%x)
	li a7, 34
	li a0, %x
	ecall
	.end_macro

	.macro print_bin (%x)
	li a7, 35
	mv a0, %x
	ecall
	.end_macro

	.macro print_bin_imm (%x)
	li a7, 35
	li a0, %x
	ecall
	.end_macro
	
	.macro endl
	li a7, 11
	li a0, '\n'
	ecall
	.end_macro 
	
	#macros to read value from console
	.macro cin (%x) 
	li a7,5
	ecall
	mv %x,a0
	.end_macro

main:

	cin(t0)
	print_hex(t0)
	endl
	print_hex_imm(3)
	endl
	print_bin(t0)
	endl
	print_bin_imm(5)


	
	