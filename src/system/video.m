#include <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>
#include <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

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


int getkey(void) {
    int rc;


    return rc;
}


void I_GetEvent(void) {

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
    //memcpy(src, data, 320*200*4);
}

void I_StartFrame() {
    // er?
}

void I_StartTic() {
    // TODO
}

