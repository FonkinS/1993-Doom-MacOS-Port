#include "global/doomdef.h"
#include "init/main.h"
#include "system/video.h"
#include <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>
#include <CoreGraphics/CoreGraphics.h>
#include <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

#include "init/event.h"

static NSImageView* imageView = nil;
static NSBitmapImageRep* bitmap = nil;
static BOOL windowShouldClose = NO;

unsigned char *screens[5];
extern unsigned char gammatable[5][256];

unsigned char* palette;

enum {INPUT_CLASSIC, INPUT_MODERN};
int input_type = INPUT_MODERN;

BOOL mouse_out = false; // Mouse not hidden

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
    if (input_type == INPUT_CLASSIC) {
        switch (k) {
            case kVK_LeftArrow: rc = KEY_LEFTARROW; break;
            case kVK_RightArrow: rc = KEY_RIGHTARROW; break;
            case kVK_UpArrow: rc = KEY_UPARROW; break;
            case kVK_DownArrow: rc = KEY_DOWNARROW; break;
            case kVK_Escape: rc = KEY_ESCAPE; break;
            case kVK_Return: rc = KEY_ENTER; break;
            case 6:
            case kVK_RightShift:
            case kVK_Shift: rc = KEY_RSHIFT; break;
            case 7: // TODO GET PROPER CONTROL
            case kVK_Command:
            case kVK_RightControl:
            case kVK_Control: rc = KEY_RCTRL; break;
            case 8:
            case kVK_RightOption:
            case kVK_Option: rc = KEY_RALT; break;

            case kVK_Space: rc = 0x20;

            default:
                if (k > 32) break;
                rc = keyCodeToASCII[k]+32;
                break;
        }
    } else if (input_type == INPUT_MODERN) {
        switch (k) {
            case 0x0: rc = KEY_LEFTARROW; break;
            case 0x1: rc = KEY_DOWNARROW; break;
            case 0x2: rc = KEY_RIGHTARROW; break;
            case 0xD: rc = KEY_UPARROW; break;
            case 0xE: rc = 0x20; break;
            case kVK_Escape: 
                [NSCursor unhide];
                mouse_out = true; 
                rc = KEY_ESCAPE;
                break;
            case kVK_Return: rc = KEY_ENTER; break;
        }
    }


    return rc;
}


@interface Window : NSWindow
@end

@implementation Window

- (BOOL) canBecomeKeyWindow {
    return YES;
}

- (BOOL) canBecomeMainWindow {
    return YES;
}

- (void)keyDown:(NSEvent *)event {
    int key = getKey(event.keyCode);
    event_t d_event;
    d_event.type = ev_keydown;
    d_event.data1 = key;
    D_PostEvent(&d_event);

   
}

- (void)keyUp:(NSEvent *)event {
    int key = getKey(event.keyCode);
    event_t d_event;
    d_event.type = ev_keyup;
    d_event.data1 = key;
    D_PostEvent(&d_event);
    if (input_type == INPUT_MODERN && (key == 0 || key == 2)) {
        event_t d_event;
        d_event.type = ev_keyup;
        d_event.data1 = KEY_RALT;
        D_PostEvent(&d_event);
    }
}

- (void)flagsChanged:(NSEvent *)event {
    int key = getKey(event.keyCode);
    unsigned long flags = event.modifierFlags;
    event_t d_event;
    if (input_type == INPUT_CLASSIC) {
        if (key == KEY_RSHIFT)
            d_event.type = flags & NSEventModifierFlagShift ? ev_keydown : ev_keyup;
        if (key == KEY_RCTRL)
            d_event.type = flags & NSEventModifierFlagControl ? ev_keydown : ev_keyup;
    }
    if (key == KEY_RALT)
        d_event.type = flags & NSEventModifierFlagOption ? ev_keydown : ev_keyup;
    d_event.data1 = key;
    D_PostEvent(&d_event);
}

BOOL mouse_state = false;
- (void) mouseDown:(NSEvent *)event {
    if (input_type != INPUT_MODERN) return;
    event_t d_event;
    d_event.type = ev_mouse;
    d_event.data1 = mouse_state = 1;
    d_event.data2 = 0;
    d_event.data3 = 0;
    D_PostEvent(&d_event);
    [NSCursor hide];
    mouse_out = false;
}

- (void) mouseUp:(NSEvent *)event {
    if (input_type != INPUT_MODERN) return;
    event_t d_event;
    d_event.type = ev_mouse;
    d_event.data1 = mouse_state = 0;
    d_event.data2 = 0;
    d_event.data3 = 0;
    D_PostEvent(&d_event);

}

int warp_countdown = 0;
float prev_delta_x = 0;
float prev_delta_y = 0;
- (void) mouseMoved:(NSEvent *)event {
    if (input_type != INPUT_MODERN) return;
    if (mouse_out) return;
    event_t d_event;
    NSPoint mpos = [NSEvent mouseLocation];
    d_event.type = ev_mouse;
    d_event.data1 = mouse_state;
    if (!warp_countdown) d_event.data2 = [event deltaX] * 3;
    else d_event.data2 = prev_delta_x;
    if (!warp_countdown) d_event.data3 = -[event deltaY];
    else d_event.data3 = -prev_delta_y;
    D_PostEvent(&d_event);
    
    if (warp_countdown) warp_countdown--;

    NSRect frame = [self frame];
    NSPoint center = NSMakePoint(NSMidX(frame), NSMidY(frame)/2);

    if (NSPointInRect(mpos, frame))
        return;
    CGWarpMouseCursorPosition(center);
    warp_countdown = 2;
    prev_delta_x = d_event.data2;
    prev_delta_x = d_event.data3;
}


@end
static Window* window = nil;



void I_InitGraphics() {
    @autoreleasepool {
        [NSApplication sharedApplication];
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

        id appDelegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:appDelegate];

        NSRect frame = NSMakeRect(0, 0, WIDTH, HEIGHT);
        window = [[Window alloc] initWithContentRect:frame 
                      styleMask:NSWindowStyleMaskTitled |
                        NSWindowStyleMaskClosable |
                        /*NSWindowStyleMaskResizable |*/
                        NSWindowStyleMaskMiniaturizable
                      backing:NSBackingStoreBuffered
                      defer:NO];
        [window setAcceptsMouseMovedEvents:YES];
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

        NSPoint center = NSMakePoint(NSMidX(frame), NSMidY(frame)/2);
        CGWarpMouseCursorPosition(center);

        if (input_type == INPUT_MODERN)
            [NSCursor hide];


    }
}

void I_ShutdownGraphics() {
    // Cocoa doesn't need to shut down in the same way
    // Objective C is memory safe-ish
    printf("Shutting down Cocoa Graphics\n");
}

void I_SetPalette(unsigned char *pal) {
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

