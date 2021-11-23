;[org 0x7e00]

jmp EnterPM

%include "gdt.asm"

EnterPM:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp codeseg:StartProtectedMode
EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

[bits 32]
[extern _start]
StartProtectedMode:
    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    call _start
    jmp $
times 32768-($-$$) db 0