# Write the assembly code for main

.global main

.text
less:
   cmp $0, %r15
   jg greater
   mov $lessMsg, %rdi
   mov $0, %al
   call printf
   leave
   ret

greater:
   cmp $0, %r15
   jl less
   mov $greaterMsg, %rdi
   mov $0, %al
   call printf
   leave
   ret

param_err:
   mov $ERR_MSG, %rdi
   mov $0, %al
   call printf
   leave
   ret


main:
  # Function prologue
  enter $0, $0


  # Variable mappings:
  # op -> %r12
  # arg1 -> %r13
  
  movq %rdi, %r14  # argc

  cmp $3, %r14
	jne param_err

  movq 8(%rsi), %r12  # op = argv[1]
  movq 16(%rsi), %r13 # arg1 = argv[2]
	
	mov %r12, %rdi
	mov $0, %al
	call atol
	
	mov %rax, %r12
	
	mov %r13, %rdi
        mov $0, %al
        call atol
	
	mov %rax, %r13

	mov %r12, %rdi
	mov %r13, %rsi
	mov $0, %al
	
	call compare
	
	# mov %rax, %r15
	# mov %rax, %r15
	
	mov %rax, %r15
	
	cmp $0, %r15
	   jl less
	   jg greater
	   mov $eqMsg, %rdi
	   mov $0, %al
	   call printf
	
	leave
	ret


.data
greaterMsg: .asciz "greater\n"
eqMsg: .asciz "equal\n"
lessMsg: .asciz "less\n"
ERR_MSG: .asciz "Two arguments required\n"

format: .asciz "%ld\n"


