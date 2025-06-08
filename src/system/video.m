#include "global/doomdef.h"
#include "init/main.h"
#include "system/video.h"
#include <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>
#include <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

#include "init/event.h"

static NSWindow* window = nil;
static NSImageView* imageView = nil;
static NSBitmapImageRep* bitmap = nil;
static BOOL windowShouldClose = NO;

unsigned char *screens[5];
extern unsigned char gammatable[5][256];

unsigned char* palette;

#define SCALE 2
#define WIDTH 640
#define HEIGHT 400


@interface AppDelegate : NSObject <NSWindowDelegate>
@end

@implementation AppDelegate

- (void) windowWillClose:(NSNotification*)notification {
    windowShouldClose = YES;
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication*) application {
    windowShouldClose = YES;
    return NSTerminateNow;
} 

@end


unsigned char keyCodeToASCII[] = {
    65,83,68,70,72,71,90,88,
    67,86, 0,66,81,87,69,82,
    89,84,49,50,51,52,54,53,
    61,57,55,45,56,48,93,79,
    85,91,73,80, 0,76,74, 0,
    75, 0, 0, 0, 9, 78,77,0
};


int getKey(unsigned int k) {
    int rc = 0;
    switch (k) {
        case kVK_LeftArrow: rc = KEY_LEFTARROW; break;
        case kVK_RightArrow: rc = KEY_RIGHTARROW; break;
        case kVK_UpArrow: rc = KEY_UPARROW; break;
        case kVK_DownArrow: rc = KEY_DOWNARROW; break;
        case kVK_Escape: rc = KEY_ESCAPE; break;
        case kVK_Return: rc = KEY_ENTER; break;
        case kVK_Tab: rc = KEY_TAB; break;
        case kVK_F1: rc = KEY_F1; break;
        case kVK_F2: rc = KEY_F2; break;
        case kVK_F3: rc = KEY_F3; break;
        case kVK_F4: rc = KEY_F4; break;
        case kVK_F5: rc = KEY_F5; break;
        case kVK_F6: rc = KEY_F6; break;
        case kVK_F7: rc = KEY_F7; break;
        case kVK_F8: rc = KEY_F8; break;
        case kVK_F9: rc = KEY_F9; break;
        case kVK_Delete: rc = KEY_BACKSPACE; break;
        case kVK_ANSI_Equal: rc = KEY_EQUALS; break;
        case kVK_ANSI_Minus: rc = KEY_MINUS; break;
        case kVK_RightShift:
        case kVK_Shift: rc = KEY_RSHIFT; break;
        case kVK_RightControl:
        case kVK_Control: rc = KEY_RCTRL; break;
        case kVK_RightOption:
        case kVK_Option: rc = KEY_RALT; break;

        case kVK_Space: rc = 0x20;
        
        
        default:
            if (k < 0x30)
                rc = keyCodeToASCII[k];

            break;
    }


    return rc;
}


void handleEvent(NSEvent* e) {
    event_t event;
    unsigned long key;
    switch (e.type) {
        case NSEventTypeKeyDown:
            key = getKey(e.keyCode);
            event.type = ev_keydown;
            event.data1 = key;
            break;
        case NSEventTypeKeyUp:
            key = getKey(e.keyCode);
            event.type = ev_keyup;
            event.data1 = key;
            break;
        default:
            break;
    }


    D_PostEvent(&event);
}


void I_InitGraphics() {
    @autoreleasepool {
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

        id appDelegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:appDelegate];

        NSRect frame = NSMakeRect(0, 0, WIDTH, HEIGHT);
        window = [[NSWindow alloc] initWithContentRect:frame 
                      styleMask:NSWindowStyleMaskTitled |
                        NSWindowStyleMaskClosable |
                        /*NSWindowStyleMaskResizable |*/
                        NSWindowStyleMaskMiniaturizable
                      backing:NSBackingStoreBuffered
                      defer:NO];
        [window setTitle:@"DOOM Engine on macOS"];
        [window makeKeyAndOrderFront:nil];
        [NSApp activateIgnoringOtherApps:YES];
        [window center];

        ProcessSerialNumber psn = {0, kCurrentProcess};
        TransformProcessType(&psn, kProcessTransformToForegroundApplication);
        SetFrontProcess(&psn);

        NSMenu *menubar = [[NSMenu alloc] init];
        NSMenuItem *appMenuItem = [[NSMenuItem alloc] init];
        [menubar addItem:appMenuItem];
        [NSApp setMenu:menubar];

        NSMenu* appMenu = [[NSMenu alloc] init];
        //NSString* appName = [[NSProcessInfo processInfo] processName];
        NSString* quitTitle = @"Title";
        NSMenuItem* quitMenuItem = [[NSMenuItem alloc] initWithTitle: quitTitle
                                                        action: @selector(terminate:)
                                                        keyEquivalent:@"q"]; 

        [appMenu addItem: quitMenuItem];
        [appMenuItem setSubmenu:appMenu];

        [window setDelegate:appDelegate];
        bitmap = [[NSBitmapImageRep alloc]
            initWithBitmapDataPlanes: NULL
                          pixelsWide: WIDTH
                          pixelsHigh: HEIGHT
                       bitsPerSample: 8
                     samplesPerPixel: 4
                            hasAlpha: YES
                            isPlanar: NO
                      colorSpaceName: NSCalibratedRGBColorSpace
                         bytesPerRow: 0
                         bitsPerPixel:0
        ];

        NSImage* image = [[NSImage alloc] initWithSize: frame.size];
        [image addRepresentation:bitmap];

        imageView = [[NSImageView alloc] initWithFrame: frame];
        [imageView setImage:image];
        imageView.layer.magnificationFilter = kCAFilterNearest;
        imageView.layer.minificationFilter = kCAFilterNearest;
        [window.contentView addSubview:imageView];
    }
}

void I_ShutdownGraphics() {
    // Cocoa doesn't need to shut down in the same way
    // Objective C is memory safe-ish
    printf("Shutting down Cocoa Graphics\n");
}

void I_SetPalette(unsigned char *pal) {
    printf("Setting down Palette\n");
    palette = pal;
}

void I_UpdateNoBlit() {
    // ???
}

void I_FinishUpdate() {


    // Handle Events
    @autoreleasepool {
        NSEvent* event;
        while ((event = [NSApp nextEventMatchingMask:NSEventMaskAny 
                                untilDate:[NSDate distantPast] 
                                   inMode:NSDefaultRunLoopMode 
                                  dequeue: YES])) {
            handleEvent(event);
            [NSApp sendEvent:event];

        }
        [NSApp updateWindows];
    }


    // Draw Image
    int *data = (int*)[bitmap bitmapData];
    for (int y = 0; y < 200; y++) {
        for (int r = 0; r < SCALE; r++) {
            for (int x = 0; x < 320; x++) {
                int index = (int)*(uint8_t*)(screens[0] + y * 320 + x); 
                uint32_t col = 0xff000000 | 
                    palette[index*3] | 
                    palette[index*3+1] << 8 | 
                    palette[index*3+2] << 16;
                for (int c = 0; c < SCALE; c++) 
                    *(data++) = col;
            }
        }
    }
    [imageView setNeedsDisplay: YES];

    if (windowShouldClose) {
        exit(0); // TODO MAKE CLEANER
    }
}


void I_ReadScreen(unsigned char *src) {
    //unsigned char* data = [bitmap bitmapData];
    memcpy(src, screens[0], SCREENWIDTH * SCREENHEIGHT);
}

void I_StartFrame() {
    // er?
}

void I_StartTic() {
    // TODO
}

