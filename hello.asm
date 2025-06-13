global _start

section .data
message: db "hello, world!", 10

section .text
_start:
    mov rax, 1 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, message
    mov rdx, 14 ; number of bytes
    syscall

    mov rax, 60 ; exit syscall
    xor rdi, rdi ; exit code
    syscall
