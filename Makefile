INCLUDE := -I ~/include
LDFLAGS := -L ~/lib -lsense -lm
CFLAGS := -Wall -Werror -g

all: integrate

displayclock: main.o calc.o
	gcc -o integrate main.o calc.o $(LDFLAGS)

run: integrate
	./integrate

debug: integrate
	gdb integrate
	
clean:
	rm -f *.o integrate
	
main.o: main.c calc.h
	gcc $(CFLAGS) -c main.c -I ~/include

calc.o: calc.c calc.h
	gcc $(CFLAGS) -c calc.c -I ~/include
