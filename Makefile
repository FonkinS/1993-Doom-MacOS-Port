CC=clang
CFLAGS=-g -Wall -DNORMALUNIX -DLINUX --include-directory=include 

ifdef DEBUG
	CFLAGS += -O0 -Wno-unused-const-variable -Wno-unused-but-set-variable
endif

#LDFLAGS=-L/usr/X11R6/lib
#LIBS=-lXext -lX11 -lnsl -lm
LIBS = -framework Cocoa -framework Foundation -framework QuartzCore

SOURCE_DIR = src
BUILD_DIR = build
WAD_DIR = WAD
OBJECT_DIR = $(BUILD_DIR)/objects

SOURCES = $(shell find $(SOURCE_DIR) -name '*.c')
MSOURCES = $(shell find $(SOURCE_DIR) -name '*.m')
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c, $(OBJECT_DIR)/%.o, $(SOURCES))
OBJECTS += $(patsubst $(SOURCE_DIR)/%.m, $(OBJECT_DIR)/%.o, $(MSOURCES))

OUTPUT_NAME = $(BUILD_DIR)/doom

all: $(OUTPUT_NAME)

#all:
#	echo $(SOURCES)
#	echo $(OBJECTS)

clean:
	rm -f -r build/*

$(OUTPUT_NAME):	$(OBJECTS)
	$(CC) $(LIBS) $(CFLAGS) $(OBJECTS) -o $@ $(LIBS)


$(OBJECT_DIR)/%.o:	$(SOURCE_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Objective C
$(OBJECT_DIR)/%.o:	$(SOURCE_DIR)/%.m
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run: $(OUTPUT_NAME)
	./$<

