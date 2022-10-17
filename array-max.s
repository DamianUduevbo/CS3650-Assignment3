# Write the assembly code for array_max

.global array_max

.text
# ends the for loop/programme
end_loop:
        leave
        ret

# increment i by 1
increment_index:
	mov %rdx, %rax
	inc %r14
	jmp loop

# for loop
loop:
	# if i >= n
	cmp %r12, %r14
	jge end_loop # end loop/programme otherwise continue loop
	
	mov (%r13, %r14, 8), %rdx
	
	# if item[i] >= max
	cmp %rax, %rdx
	jge increment_index # 
	inc %r14	    # increment i by 1
	jmp loop	    


array_max:
	# Prologue:
	# Set up stack frame.
	enter $8, $0
	
	# Body:
        mov %rdi, %r12 #unsigned long n = arg1
	mov %rsi, %r13 #unsigned long *item = arg2

	mov $0, %rax # max = 0
	mov $0, %r14 # int i = 0
	
	# for loop
	jmp loop
	
	# Epilogue:
	leave
	ret

.data
format: .asciz "%ld\n"

