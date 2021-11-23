[bits 16]
[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

;mov bx, BOOT_STRING
;call print_string

call ReadDisk

jmp PROGRAM_SPACE

%include "print.asm"
%include "disk.asm"

times 510-($-$$) db 0
dw 0xAA55