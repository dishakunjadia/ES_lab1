
hello.txt:
	echo "Hello world!" > hello.txt

PICO_TOOLCHAIN_PATH ?= C:/Users/disha/pico-sdk/GNU_Arm_Embedded_Toolchain/10_2021.10/bin
CPP = $(PICO_TOOLCHAIN_PATH)/arm-none-eabi-cpp
CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as

main.i: main.c
	$(CPP) main.c > main.i

clean:
	rm -f main.i hello.txt

main.s: main.i
	$(CC) -S main.i

main.o: main.s
	$(AS) main.s -o main.o

second.o: second.s
	$(AS) second.s -o second.o

%.o: %.s
	$(AS) $< -o $@

