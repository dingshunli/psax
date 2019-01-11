CC = gcc
TID = 1
TESTFLAGS = -DTEST_$(TID)
DEBUGFLAGS = -DDEBUG -g
CFLAGS = -I.
PROCESS_NUM = 1
FILE_NAME = test3.xml


.PHONY: test
test: testmain psax.a
	./testmain $(PROCESS_NUM) $(FILE_NAME)

testmain: testmain.c psax.a
	gcc -o $@ psax.a testmain.c $(CFLAGS) $(DEBUGFLAGS)

psax.a: psax.c psax.h makefile global.h
	gcc -c psax.c $(TESTFLAGS) $(DEBUGFLAGS)
	ar -r $@ psax.o
	rm *.o

