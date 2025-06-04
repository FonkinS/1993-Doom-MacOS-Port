CC=clang
CFLAGS=-g -Wall -DNORMALUNIX -DLINUX --include-directory=include 

ifdef DEBUG
	CFLAGS += -O0 -Wno-unused-const-variable -Wno-unused-but-set-variable
endif

#LDFLAGS=-L/usr/X11R6/lib
#LIBS=-lXext -lX11 -lnsl -lm
LIBS=-lm

SOURCE_DIR = src
BUILD_DIR = build
WAD_DIR = WAD
OBJECT_DIR = $(BUILD_DIR)/objects

SOURCES = $(shell find $(SOURCE_DIR) -name '*.c')
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c, $(OBJECT_DIR)/%.o, $(SOURCES))

OUTPUT_NAME = $(BUILD_DIR)/doom

all: $(OUTPUT_NAME)
	bear -- $(LIBS) $(CFLAGS)

#all:
#	echo $(SOURCES)
#	echo $(OBJECTS)

clean:
	rm -f -r build/*

$(OUTPUT_NAME):	$(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LIBS)


$(OBJECT_DIR)/%.o:	$(SOURCE_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run: $(OUTPUT_NAME)
	./$<

