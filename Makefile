PROGRAM ?=

build:
	@nasm -felf64 $(PROGRAM).asm -o $(PROGRAM).o
	@ld -o $(PROGRAM) $(PROGRAM).o
	@chmod u+x $(PROGRAM)

run: build
	./$(PROGRAM)

debug: build
	gdb ./$(PROGRAM)