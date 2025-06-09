CC=clang
CFLAGS=-g -Wall -DNORMALUNIX -DLINUX --include-directory=include 

ifdef DEBUG
	CFLAGS += -O0 -Wno-unused-const-variable -Wno-unused-but-set-variable -Werror=pointer-to-int-cast -Werror=int-to-void-pointer-cast
endif

ifdef BUNDLE
	CFLAGS += -DBUNDLE
endif

#LDFLAGS=-L/usr/X11R6/lib
#LIBS=-lXext -lX11 -lnsl -lm
LIBS = -framework Cocoa -framework Foundation -framework QuartzCore

SOURCE_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
WAD_DIR = WAD
OBJECT_DIR = $(BUILD_DIR)/objects

SOURCES = $(shell find $(SOURCE_DIR) -name '*.c')
MSOURCES = $(shell find $(SOURCE_DIR) -name '*.m')
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c, $(OBJECT_DIR)/%.o, $(SOURCES))
OBJECTS += $(patsubst $(SOURCE_DIR)/%.m, $(OBJECT_DIR)/%.o, $(MSOURCES))

PLIST = $(INCLUDE_DIR)/Info.plist
ICON = $(INCLUDE_DIR)/icon.icns

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

bundle: $(OUTPUT_NAME)
	mkdir -p $(BUILD_DIR)/DOOM-1993.app/Contents/{MacOS,Resources}
	cp $(OUTPUT_NAME) $(BUILD_DIR)/DOOM-1993.app/Contents/MacOS/DOOM-1993
	cp $(PLIST) $(BUILD_DIR)/DOOM-1993.app/Contents
	cp $(ICON) $(BUILD_DIR)/DOOM-1993.app/Contents/Resources
	cp -r $(WAD_DIR) $(BUILD_DIR)/DOOM-1993.app/Contents/Resources
