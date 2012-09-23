//
//  INTController.m
//  Interval
//
//  Created by Ichi Kanaya on 22/09/2012.
//  Copyright (c) 2012 Ichi Kanaya. All rights reserved.
//

#import <QTKit/QTKit.h>
#import "INTController.h"

#define USERNAME        @"kanaya"
#define PROJECTNAME     @"Interval"

#define RABBIT          @"Rabbit"
#define N_RABBIT        158
#define RABBIT_ORIGIN_X 0
#define RABBIT_ORIGIN_Y 0
#define RABBIT_WIDTH    320
#define RABBIT_HEIGHT   200

#define RACOON          @"Racoon"
#define N_RACOON        61
#define RACOON_ORIGIN_X 0
#define RACOON_ORIGIN_Y 0
#define RACOON_WIDTH    320
#define RACOON_HEIGHT   200

@implementation INTController

- (void)initializeAnimalNameArrayAndAnimalInfoDictionary {
    animalNameArray = [NSArray arrayWithObjects: RABBIT, RACOON, nil];
    animalInfoDictionary = [NSMutableDictionary dictionaryWithCapacity: 10];
    // Rabbit
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: 10]
                             forKey: RABBIT];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithInt: N_RABBIT]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_ORIGIN_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_ORIGIN_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_WIDTH]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_HEIGHT]
                                                    forKey: @"Height"];
    // Racoon
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: 10]
                             forKey: RACOON];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithInt: N_RACOON]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_ORIGIN_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_ORIGIN_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_WIDTH]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_HEIGHT]
                                                    forKey: @"Height"];
}

- (void)loadImages {
    for (NSString *animal in animalNameArray) {
        NSMutableDictionary *info = [animalInfoDictionary objectForKey: animal];
        int n = [[info objectForKey: @"N"] intValue];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity: n];
        for (int i = 0; i < n; ++i) {
            NSString *filename = [NSString stringWithFormat: @"/Users/%@/Pictures/%@/%@/%d.png", USERNAME, PROJECTNAME, animal, i + 1];
            NSLog(@"Loading %@", filename);
            NSBitmapImageRep *bitmapImage = [NSBitmapImageRep imageRepWithContentsOfFile: filename];
            CGImageRef image = [bitmapImage CGImage];
            CALayer *layer = [CALayer layer];
            layer.contents = (__bridge id)image;
            double originX = [[info objectForKey: @"OriginX"] doubleValue];
            double originY = [[info objectForKey: @"OriginY"] doubleValue];
            double width = [[info objectForKey: @"Width"] doubleValue];
            double height = [[info objectForKey: @"Height"] doubleValue];
            layer.frame = CGRectMake(originX, originY, width, height);
            [array addObject: layer];
        }
        [animationLayers setObject: array
                            forKey: animal];
    }
#if 0
    // Rabbit
    /// rabbitLayers = [NSMutableArray arrayWithCapacity: N_RABBIT];
    int n_rabbit = [[[animalInfoDictionary objectForKey: RABBIT] objectForKey: @"N"] intValue];
    rabbitLayers = [NSMutableArray arrayWithCapacity: n_rabbit];
    for (int i = 0; i < n_rabbit; ++i) {
        NSString *filename = [NSString stringWithFormat: @"/Users/%@/Pictures/%@/%@/%d.png", USERNAME, PROJECTNAME, RABBIT, i + 1];
        NSLog(@"%@", filename);
        NSBitmapImageRep *bitmapImage = [NSBitmapImageRep imageRepWithContentsOfFile: filename];
        CGImageRef image = [bitmapImage CGImage];
        CALayer *layer = [CALayer layer];
        layer.contents = (__bridge id)image;
        layer.frame = CGRectMake(RABBIT_ORIGIN_X, RABBIT_ORIGIN_Y, RABBIT_WIDTH, RABBIT_HEIGHT);
        [rabbitLayers addObject: layer];
    }
#endif
}

// worked, ok, but we don't need any more
- (void)kickMe: (NSTimer *)theTimer {
    [(CALayer *)[theTimer userInfo] removeFromSuperlayer];
}

// worked, ok, but we don't need any more
- (void)showLayerForAWhile: (CALayer *)layer {
    [backgroundLayer addSublayer: layer];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                             target: self
                                           selector: @selector(kickMe:)
                                           userInfo: layer
                                            repeats: NO];
}

- (void)countDownAnimationTimer {
    for (NSString *animal in animalNameArray) {
        NSNumber *number = [animationStatus objectForKey: animal];
        int n = [number intValue];
        if (n > 0) {
            --n;
        }
        // NSLog(@"%@ n == %d", animal, n);
        [animationStatus setObject: [NSNumber numberWithInt: n]
                            forKey: animal];
    }
}

- (void)showImageLayers {
    if (currentVisibleImageLayers) {
        for (CALayer *layer in currentVisibleImageLayers) {
            [layer removeFromSuperlayer];
            /// layer = nil;
        }
    }
    currentVisibleImageLayers = nil;

    currentVisibleImageLayers = [NSMutableArray arrayWithCapacity: 10];
    
    for (NSString *animal in animalNameArray) {
        NSNumber *number = [animationStatus objectForKey: animal];
        int n = [number intValue];
        int n_animal = [[[animalInfoDictionary objectForKey: animal] objectForKey: @"N"] intValue];
        if (n > 0) {
            CALayer *layer = [[animationLayers objectForKey: animal] objectAtIndex: n_animal - n];
            [backgroundLayer addSublayer: layer];
            [currentVisibleImageLayers addObject: layer];
        }
    }
#if 0
    NSNumber *number = [animationStatus objectForKey: RABBIT];
    int n = [number intValue];
    if (n > 0) {
        CALayer *layer = [[animationLayers objectForKey: @"Rabbit"] objectAtIndex: N_RABBIT - n];  // okay?
        [backgroundLayer addSublayer: layer];
        [currentVisibleImageLayers addObject: layer];
    }
#endif
}

- (void)timerFire: (NSTimer *)theTimer {
    [self countDownAnimationTimer];
    [self showImageLayers];
}

- (void)initializeAnimationStatus {
    animationStatus = [NSMutableDictionary dictionaryWithCapacity: 10];
    for (NSString *animal in animalNameArray) {
        [animationStatus setObject: [NSNumber numberWithInt: 0]
                            forKey: animal];
    }
}

- (void)awakeFromNib {
    animationLayers = [NSMutableDictionary dictionaryWithCapacity: 10];
    [self initializeAnimalNameArrayAndAnimalInfoDictionary];
    
    currentVisibleImageLayers = nil;
    
    [self loadImages];
    [self initializeAnimationStatus];
    
    // animation status
    
    // background layer
    CGColorRef blackColor;
    backgroundLayer = [CALayer layer];
    blackColor = CGColorCreateGenericGray(0, 1.0f);
    backgroundLayer.backgroundColor = blackColor;
    CGColorRelease(blackColor);
    
    // image layers
    /// imageLayer = [CALayer layer];
    
    /// NSBitmapImageRep *bitmapImage = [NSBitmapImageRep imageRepWithContentsOfFile: @"/Users/kanaya/Pictures/Interval/Rabbit/1.png"];
    /// CGImageRef image = [bitmapImage CGImage];
    /// imageLayer.contents = (__bridge id)image;
    /// imageLayer.frame = CGRectMake(0, 0, 320, 200);
    
    // movie layers
    QTMovie *movie = [QTMovie movieWithFile: @"/Users/kanaya/Movies/Interval/movie1.mov" error: NULL];
    [movie setAttribute: [NSNumber numberWithBool: YES]
                 forKey: QTMovieLoopsAttribute];
    
    QTMovieLayer *movieLayer = [QTMovieLayer layerWithMovie: movie];
    movieLayer.frame = CGRectMake(0, 0, 1280, 200);
    [backgroundLayer addSublayer: movieLayer];
    
    [_view setLayer: backgroundLayer];
    [_view setWantsLayer: YES];

    timer = [NSTimer scheduledTimerWithTimeInterval: 0.2
                                             target: self
                                           selector: @selector(timerFire:)
                                           userInfo: nil
                                            repeats: YES];
   
    
    [movie play];
}

- (IBAction)sensor1TunrnedOn: (id)sender {
    NSLog(@"Sensor 1.");
    [animationStatus setObject: [NSNumber numberWithInt: N_RABBIT]
                        forKey: RABBIT];
}

- (IBAction)sensor2TunrnedOn: (id)sender {
    NSLog(@"Sensor 2.");
    [animationStatus setObject: [NSNumber numberWithInt: N_RACOON]
                        forKey: RACOON];
}

@end
