.PHONY: clean
.SUFFIXES:

#CC65_HOME=$(HOME)/marshall/cc65

TARGET=c64

CC=cc65
CFLAGS=-O -t c64
AS=ca65
AFLAGS=-t c64
LD=ld65
LDFLAGS=-t c64
AR=ar65

hello: hello.o text.o
	$(LD) -o $@ $(LDFLAGS) $^ c64.lib

%.o: %.s
	$(AS) -o $@ $(AFLAGS) $<

%.s : %.c
	$(CC) -o $@ $(CFLAGS) $<

clean:
	rm -f hello hello.o hello.s text.o
