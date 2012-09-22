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
    imageLayer.frame = CGRectMake(0, 0, 256, 160);
    
    // movie layers
    QTMovie *movie = [QTMovie movieWithFile: @"/Users/kanaya/Movies/movie1.mov" error: NULL];
    
    QTMovieLayer *movieLayer = [QTMovieLayer layerWithMovie: movie];
    movieLayer.frame = CGRectMake(0, 0, 512, 320);
    [backgroundLayer addSublayer: movieLayer];
    
    [_view setLayer: backgroundLayer];
    [_view setWantsLayer: YES];
    
    [movie play];
}


@end
