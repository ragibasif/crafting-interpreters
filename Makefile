# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99 -O2 -I.

# Source files
SRCS = chunk.c compiler.c debug.c main.c memory.c scanner.c value.c vm.c

# Object files
OBJS = $(SRCS:.c=.o)

# Executable name
TARGET = clox

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compile each .c file into an object file
%.o: %.c chunk.h common.h compiler.h debug.h memory.h scanner.h value.h vm.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(TARGET)

# Phony targets
.PHONY: all clean


