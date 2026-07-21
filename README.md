# Assembly-system-calls for  x86_64 architecture
This section illustrate system calls
NASM assembler is used
All registers are 64 bits
Stack operation is implemented using pop and push
# Instructions explained 
mov for move register to register ,memory to register
syscall it handles the kernel to do operation

# NASM instructions
nasm -f elf64 dwarf -g -F file.asm -o file.o 

ld file -o file -o to link it
# Executing the program
./file

# Debugging 
Use gdb : gdb ./file

# Disassembling machine code to human readable
objdump -d file 

# Updating....
I will update in the soon
