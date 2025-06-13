section .text
global leap_year
leap_year:
    mov rbx, 400
    call .divise
    jz .success

    mov rbx, 100
    call .divise
    jz .error

    mov rbx, 4
    call .divise
    jz .success

    mov rax, 0
    ret

.divise:
    mov rax, rdi
    xor rdx, rdx
    div rbx
    test rdx, rdx ; RAX = quotient, RDX = remainder

.error:
    mov rax, 0
    ret

.success:
    mov rax, 1
    ret
