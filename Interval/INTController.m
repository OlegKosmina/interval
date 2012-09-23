//
//  INTController.m
//  Interval
//
//  Created by Ichi Kanaya on 22/09/2012.
//  Copyright (c) 2012 Ichi Kanaya. All rights reserved.
//

#import <QTKit/QTKit.h>
#import "INTController.h"

#define N_RABBIT 15 /* 8 */
#define RABBIT_ORIGIN_X 0
#define RABBIT_ORIGIN_Y 0
#define RABBIT_WIDTH    320
#define RABBIT_HEIGHT   200

@implementation INTController

- (void)loadImages {
    // Rabbit
    rabbitLayers = [NSMutableArray arrayWithCapacity: N_RABBIT];
    for (int i = 0; i < N_RABBIT; ++i) {
        NSString *filename = [NSString stringWithFormat: @"/Users/kanaya/Pictures/Interval/Rabbit/%d.png", i + 1];
        NSLog(@"%@", filename);
        NSBitmapImageRep *bitmapImage = [NSBitmapImageRep imageRepWithContentsOfFile: filename];
        CGImageRef image = [bitmapImage CGImage];
        CALayer *layer = [CALayer layer];
        layer.contents = (__bridge id)image;
        layer.frame = CGRectMake(RABBIT_ORIGIN_X, RABBIT_ORIGIN_Y, RABBIT_WIDTH, RABBIT_HEIGHT);
        [rabbitLayers addObject: layer];
    }
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
    NSNumber *number = [animationStatus objectForKey: @"Rabbit"];
    int n = [number intValue];
    if (n > 0) {
        --n;
    }
    NSLog(@"Rabbit n == %d", n);
    [animationStatus setObject: [NSNumber numberWithInt: n]
                        forKey: @"Rabbit"];
}

- (void)timerFire: (NSTimer *)theTimer {
    [self countDownAnimationTimer];
}

- (void)initializeAnimationStatus {
    animationStatus = [NSMutableDictionary dictionaryWithCapacity: 10];
    [animationStatus setObject: [NSNumber numberWithInt: 0]
                        forKey: @"Rabbit"];
    
}

- (void)awakeFromNib {
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

    timer = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                             target: self
                                           selector: @selector(timerFire:)
                                           userInfo: nil
                                            repeats: YES];
   
    
    [movie play];
}

- (IBAction)sensor1TunrnedOn: (id)sender {
    NSLog(@"Sensor 1.");
    [animationStatus setObject: [NSNumber numberWithInt: N_RABBIT]
                        forKey: @"Rabbit"];
    
    /// [self showLayerForAWhile: [rabbitLayers objectAtIndex: 0]];
    /// CALayer *layer = [[[_view layer] sublayers] objectAtIndex: 1];
    /// CALayer *layer = imageLayer;
    /// for (int i = 0; i < N_RABBIT; ++i) {
        /// CALayer *layer = [rabbitLayers objectAtIndex: i];
        /// [backgroundLayer addSublayer: layer];
        /// layer.opacity = 0.5;
        // wait a second
        /// [layer removeFromSuperlayer];
    /// }
}

@end
