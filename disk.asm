PROGRAM_SPACE equ 0x7e00
ReadDisk:
    mov ah, 0x02
    mov bx, PROGRAM_SPACE
    mov al, 64
    mov dl, [BOOT_DISK]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02
    int 0x13
    jc fail
    mov bx, DISK_READ_SUCCESS
    call print_string
    ret
BOOT_DISK:
    db 0
DISK_READ_FAIL:
    db 'Disk read failed!', 13,10,0
DISK_READ_SUCCESS:
    db 'Disk read succesfully!', 13,10, 0
fail:
    mov bx, DISK_READ_FAIL
    call print_string