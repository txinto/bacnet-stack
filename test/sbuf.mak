#Makefile to build test case
CC      = gcc
SRC_DIR = ../src
INCLUDES = -I$(SRC_DIR) -I.
DEFINES = -DBIG_ENDIAN=0 -DBAC_TEST -DTEST_STATIC_BUFFER

CFLAGS  = -Wall $(INCLUDES) $(DEFINES) -g

SRCS = $(SRC_DIR)/bacnet/basic/sys/sbuf.c \
	ctest.c

TARGET_NAME = sbuf
ifeq ($(OS),Windows_NT)
TARGET_EXT = .exe
else
TARGET_EXT =
endif
TARGET = $(TARGET_NAME)$(TARGET_EXT)

all: ${TARGET}

OBJS = ${SRCS:.c=.o}

${TARGET}: ${OBJS}
	${CC} -o $@ ${OBJS}

.c.o:
	${CC} -c ${CFLAGS} $*.c -o $@

depend:
	rm -f .depend
	${CC} -MM ${CFLAGS} *.c >> .depend

clean:
	rm -rf core ${TARGET} $(OBJS) *.bak *.1 *.ini

include: .depend

