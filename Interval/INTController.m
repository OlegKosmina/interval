//
//  INTController.m
//  Interval
//
//  Created by Ichi Kanaya on 22/09/2012.
//  Copyright (c) 2012 Ichi Kanaya. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <QTKit/QTKit.h>
#import "INTController.h"

@implementation INTController

- (void)awakeFromNib {
    // background layer
    CALayer *backgroundLayer;
    CGColorRef blackColor;
    backgroundLayer = [CALayer layer];
    blackColor = CGColorCreateGenericGray(0, 1.0f);
    backgroundLayer.backgroundColor = blackColor;
    CGColorRelease(blackColor);
    
    // image layers
    CALayer *imageLayer;
    imageLayer = [CALayer layer];
    
    NSBitmapImageRep *bitmapImage = [NSBitmapImageRep imageRepWithContentsOfFile: @"/Users/kanaya/Pictures/picture1.jpg"];
    CGImageRef image = [bitmapImage CGImage];
    imageLayer.contents = (__bridge id)image;
    imageLayer.frame = CGRectMake(0, 0, 320, 200);
    
    // movie layers
    QTMovie *movie = [QTMovie movieWithFile: @"/Users/kanaya/Movies/movie1.mov" error: NULL];
    [movie setAttribute: [NSNumber numberWithBool: YES]
                 forKey: QTMovieLoopsAttribute];
    
    QTMovieLayer *movieLayer = [QTMovieLayer layerWithMovie: movie];
    movieLayer.frame = CGRectMake(0, 0, 1280, 200);
    [backgroundLayer addSublayer: movieLayer];
    
    [_view setLayer: backgroundLayer];
    [_view setWantsLayer: YES];
    
    [movie play];
}

- (IBAction)sensor1TunrnedOn: (id)sender {
    NSLog(@"Sensor 1.");
}

@end
