section .data
codes:
    db  '0123456789ABCDEF'

section .text
global _start
_start:
    ; number 1122 in hex
    mov rax, 0x1122334455667788

    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
    ; Each 4 bits should be showed as hex digit
    ; use shift and bit AND to isolate them...
    ; the results is an offset of array 'codes'
    .loop:
        push rax
        sub rcx, 4
        ; cl is a register, the least part of rcx
        ; rax -- eax -- ax -- ah + al
        ; rcx -- ecx -- cx -- ch + cl
        sar rax, cl
        and rax, 0xf

        lea rsi, [codes + rax]
        mov rax, 1

        ; syscall let rcx and r11 modifieds
        push rcx
        syscall
        pop rcx

        pop rax
        ; is a zero? test
        test rcx, rcx
        jnz .loop

        mov rax, 60 ; exit
        xor rdi, rdi
        syscall
