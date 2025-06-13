section .text
global steps
steps:
    ; rdi = 4
    cmp rdi, 1
    jl  .error

    mov rax, 0

.loop:
    cmp rdi, 1
    je  .done

    ; check if is even through least significant bit
    test rdi, 1 ; bitwise AND operation (0010 - 0001 = 0000)
    jz .even ; jump if ZF flag is set (least significant bit is 0, so is even)

    lea rdi, [rdi*2 + rdi] ; multiply by 3
    inc rdi
    inc rax
    jmp .loop

.even:
    shr rdi, 1 ; right shift by 1 (divide by 2)
    inc rax
    jmp .loop

.error:
    mov rax, -1
    ret

.done:
    ret
