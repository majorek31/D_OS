print_string:
    mov ah, 0x0e
    .loop
    cmp [bx], byte 0
    je .end
    mov al, [bx]
    int 0x10
    inc bx
    jmp .loop
    .end
    ret

BOOT_STRING: 
    db 'Booted succesfully!', 13, 10, 0