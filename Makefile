# Toolchain
CC = /opt/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
AR = /opt/xtensa-esp32-elf/bin/xtensa-esp32-elf-ar

# Compiler flags
CFLAGS = -mlongcalls -Wall -g -Iinclude

# Source and output directories
SRC_DIR = src
OBJ_DIR = bin/obj
LIB_DIR = bin/lib

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Library name
LIB_NAME = libtask.a
LIB = $(LIB_DIR)/$(LIB_NAME)

# Default target
all: $(LIB)

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create the static library
$(LIB): $(OBJS)
	@mkdir -p $(LIB_DIR)
	$(AR) rcs $@ $^

# Clean build artifacts
clean:
	rm -rf bin

.PHONY: all clean