nasm -f bin bootloader.asm -o bootloader.bin
nasm -f elf ExtendedProgram.asm -o ExtendedProgram.o

gcc -ffreestanding -mtune=i386 -m32 -c kernel.c -o kernel.o
ld -m elf_i386 -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o kernel.o
objcopy -O binary kernel.tmp kernel.bin

cat bootloader.bin kernel.bin > D_OS.flp

qemu-system-i386 D_OS.flp