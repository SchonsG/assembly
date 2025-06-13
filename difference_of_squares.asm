section .text
global _start

_start:
    mov rdi, 10                ; argument: n = 10
    call difference_of_squares ; result in rax

    ; exit with result as status code (truncated to 8 bits)
    mov rdi, rax
    mov rax, 60                ; syscall: exit
    syscall

section .text
global square_of_sum
square_of_sum:
    xor rax, rax
    xor rcx, rcx

    .loop:
        inc rcx
        add rax, rcx
        cmp rcx, rdi
        jl .loop
    
        mov rbx, rax
        imul rax, rbx
        ret

global sum_of_squares
sum_of_squares:
    xor rax, rax ; result
    xor rcx, rcx ; counter

    .loop:
        inc rcx

        mov rdx, rcx
        imul rdx, rdx
        add rax, rdx

        cmp rcx, rdi
        jl .loop

        ret

global difference_of_squares
difference_of_squares:
    ; square_of_sum - sum_of_squares
    call sum_of_squares
    mov rbx, rax

    call square_of_sum

    sub rax, rbx
    ret
