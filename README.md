# Assembly-system-calls for  x86_64 architecture
This section illustrate write,read,open and close syscalls
NASM assembler is used
All registers are 64 bits
Stack operation is implemented using pop and push

# NASM instructions
nasm -f elf64 dwarf -g -F file.asm -o file.o to assemble
ld file -o file -o to link it
