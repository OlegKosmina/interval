//
//  INTController.m
//  Interval
//
//  Created by Ichi Kanaya on 22/09/2012.
//  Copyright (c) 2012 Ichi Kanaya. All rights reserved.
//

#import <QTKit/QTKit.h>
#import "INTController.h"

#define USERNAME                 @"kanaya"
#define PROJECTNAME              @"Interval"

#define VIEW_WIDTH               5120
#define VIEW_HEIGHT              800

#define N_ANIMAL                 10
#define N_PROPERTY               5

#define SCALE_X                  1.0 /* 0.5 */ /* 0.25 */
#define SCALE_Y                  1.0 /* 0.5 */ /* 0.25 */
#define OFFSET_X                 0.0
#define OFFSET_Y                 0.0

// D-1
#define BUTTERFLY                @"Butterfly"
#define N_BUTTERFLY              84
#define BUTTERFLY_ORIGIN_X       950
#define BUTTERFLY_ORIGIN_Y       0
#define BUTTERFLY_SCALE          1
#define BUTTERFLY_WIDTH          1280
#define BUTTERFLY_HEIGHT         931

// B-2
#define BUTTERFLY_CROWD          @"Butterfly_Crowd"
#define N_BUTTERFLY_CROWD        87
#define BUTTERFLY_CROWD_ORIGIN_X (300 * 4)
#define BUTTERFLY_CROWD_ORIGIN_Y 0
#define BUTTERFLY_CROWD_SCALE    0.5
#define BUTTERFLY_CROWD_WIDTH    1559
#define BUTTERFLY_CROWD_HEIGHT   1559

// D-2
#define DEER                     @"Deer"
#define N_DEER                   77
#define DEER_ORIGIN_X            (1100 * 4)
#define DEER_ORIGIN_Y            0
#define DEER_SCALE               1
#define DEER_WIDTH               1179
#define DEER_HEIGHT              680

// D-2
#define FOX                      @"Fox"
#define N_FOX                    47
#define FOX_ORIGIN_X             (1000 * 4)
#define FOX_ORIGIN_Y             0
#define FOX_SCALE                1
#define FOX_WIDTH                1126
#define FOX_HEIGHT               567

// A-1
#define MEERKAT                  @"Meerkat"
#define N_MEERKAT                81
#define MEERKAT_ORIGIN_X         0
#define MEERKAT_ORIGIN_Y         0
#define MEERKAT_SCALE            1
#define MEERKAT_WIDTH            1701
#define MEERKAT_HEIGHT           567

// B-2
#define OWL                      @"Owl"
#define N_OWL                    64
#define OWL_ORIGIN_X             (300 * 4)
#define OWL_ORIGIN_Y             (100 * 4)
#define OWL_SCALE                0.5
#define OWL_WIDTH                1417
#define OWL_HEIGHT               1400

// A-1
#define RABBIT                   @"Rabbit"
#define N_RABBIT                 158
#define RABBIT_ORIGIN_X          0
#define RABBIT_ORIGIN_Y          0
#define RABBIT_SCALE             0.5
#define RABBIT_WIDTH             1548
#define RABBIT_HEIGHT            879

// A-1
#define RACOON                   @"Racoon"
#define N_RACOON                 61
#define RACOON_ORIGIN_X          0
#define RACOON_ORIGIN_Y          0
#define RACOON_SCALE             1
#define RACOON_WIDTH             1296
#define RACOON_HEIGHT            800

// A-2
#define SQUIRREL_LEFT            @"Squirrel_Left"
#define N_SQUIRREL_LEFT          24
#define SQUIRREL_LEFT_ORIGIN_X   (200 * 4)
#define SQUIRREL_LEFT_ORIGIN_Y   (100 * 4)
#define SQUIRREL_LEFT_SCALE      0.5
#define SQUIRREL_LEFT_WIDTH      594
#define SQUIRREL_LEFT_HEIGHT     711

// C-1
#define SQUIRREL_RIGHT           @"Squirrel_Right"
#define N_SQUIRREL_RIGHT         23
#define SQUIRREL_RIGHT_ORIGIN_X  (800 * 4)
#define SQUIRREL_RIGHT_ORIGIN_Y  (100 * 4)
#define SQUIRREL_RIGHT_SCALE     0.5
#define SQUIRREL_RIGHT_WIDTH     696
#define SQUIRREL_RIGHT_HEIGHT    600



@implementation INTController

- (void)initializeAnimalNameArrayAndAnimalInfoDictionary {
    animalNameArray = [NSArray arrayWithObjects: BUTTERFLY, BUTTERFLY_CROWD, DEER, FOX, MEERKAT, OWL, RABBIT, RACOON, SQUIRREL_LEFT, SQUIRREL_RIGHT, nil];
    animalInfoDictionary = [NSMutableDictionary dictionaryWithCapacity: N_ANIMAL];
    
    // Butterfly
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: BUTTERFLY];
    [[animalInfoDictionary objectForKey: BUTTERFLY] setObject: [NSNumber numberWithInt: N_BUTTERFLY]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: BUTTERFLY] setObject: [NSNumber numberWithDouble: BUTTERFLY_ORIGIN_X * SCALE_X + OFFSET_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: BUTTERFLY] setObject: [NSNumber numberWithDouble: BUTTERFLY_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: BUTTERFLY] setObject: [NSNumber numberWithDouble: BUTTERFLY_WIDTH * BUTTERFLY_SCALE * SCALE_X]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: BUTTERFLY] setObject: [NSNumber numberWithDouble: BUTTERFLY_HEIGHT * BUTTERFLY_SCALE * SCALE_Y]
                                                    forKey: @"Height"];
    
    // Butterfly_Crowd
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: BUTTERFLY_CROWD];
    [[animalInfoDictionary objectForKey: BUTTERFLY_CROWD] setObject: [NSNumber numberWithInt: N_BUTTERFLY_CROWD]
                                                       forKey: @"N"];
    [[animalInfoDictionary objectForKey: BUTTERFLY_CROWD] setObject: [NSNumber numberWithDouble: BUTTERFLY_CROWD_ORIGIN_X * SCALE_X + OFFSET_X]
                                                       forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: BUTTERFLY_CROWD] setObject: [NSNumber numberWithDouble: BUTTERFLY_CROWD_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                       forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: BUTTERFLY_CROWD] setObject: [NSNumber numberWithDouble: BUTTERFLY_CROWD_WIDTH * BUTTERFLY_CROWD_SCALE * SCALE_X]
                                                       forKey: @"Width"];
    [[animalInfoDictionary objectForKey: BUTTERFLY_CROWD] setObject: [NSNumber numberWithDouble: BUTTERFLY_CROWD_HEIGHT * BUTTERFLY_CROWD_SCALE * SCALE_Y]
                                                       forKey: @"Height"];

    // Deer
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: DEER];
    [[animalInfoDictionary objectForKey: DEER] setObject: [NSNumber numberWithInt: N_DEER]
                                                       forKey: @"N"];
    [[animalInfoDictionary objectForKey: DEER] setObject: [NSNumber numberWithDouble: DEER_ORIGIN_X * SCALE_X + OFFSET_X]
                                                       forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: DEER] setObject: [NSNumber numberWithDouble: DEER_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                       forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: DEER] setObject: [NSNumber numberWithDouble: DEER_WIDTH * DEER_SCALE * SCALE_X]
                                                       forKey: @"Width"];
    [[animalInfoDictionary objectForKey: DEER] setObject: [NSNumber numberWithDouble: DEER_HEIGHT * DEER_SCALE * SCALE_Y]
                                                       forKey: @"Height"];

    // Fox
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: FOX];
    [[animalInfoDictionary objectForKey: FOX] setObject: [NSNumber numberWithInt: N_FOX]
                                                  forKey: @"N"];
    [[animalInfoDictionary objectForKey: FOX] setObject: [NSNumber numberWithDouble: FOX_ORIGIN_X * SCALE_X + OFFSET_X]
                                                  forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: FOX] setObject: [NSNumber numberWithDouble: FOX_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                  forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: FOX] setObject: [NSNumber numberWithDouble: FOX_WIDTH * FOX_SCALE * SCALE_X]
                                                  forKey: @"Width"];
    [[animalInfoDictionary objectForKey: FOX] setObject: [NSNumber numberWithDouble: FOX_HEIGHT * FOX_SCALE * SCALE_Y]
                                                  forKey: @"Height"];

    // Meerkat
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: MEERKAT];
    [[animalInfoDictionary objectForKey: MEERKAT] setObject: [NSNumber numberWithInt: N_MEERKAT]
                                                 forKey: @"N"];
    [[animalInfoDictionary objectForKey: MEERKAT] setObject: [NSNumber numberWithDouble: MEERKAT_ORIGIN_X * SCALE_X + OFFSET_X]
                                                 forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: MEERKAT] setObject: [NSNumber numberWithDouble: MEERKAT_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                 forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: MEERKAT] setObject: [NSNumber numberWithDouble: MEERKAT_WIDTH * MEERKAT_SCALE * SCALE_X]
                                                 forKey: @"Width"];
    [[animalInfoDictionary objectForKey: MEERKAT] setObject: [NSNumber numberWithDouble: MEERKAT_HEIGHT * MEERKAT_SCALE * SCALE_Y]
                                                 forKey: @"Height"];
    
    // Owl
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: OWL];
    [[animalInfoDictionary objectForKey: OWL] setObject: [NSNumber numberWithInt: N_OWL]
                                                 forKey: @"N"];
    [[animalInfoDictionary objectForKey: OWL] setObject: [NSNumber numberWithDouble: OWL_ORIGIN_X * SCALE_X + OFFSET_X]
                                                 forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: OWL] setObject: [NSNumber numberWithDouble: OWL_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                 forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: OWL] setObject: [NSNumber numberWithDouble: OWL_WIDTH * OWL_SCALE * SCALE_X]
                                                 forKey: @"Width"];
    [[animalInfoDictionary objectForKey: OWL] setObject: [NSNumber numberWithDouble: OWL_HEIGHT * OWL_SCALE * SCALE_Y]
                                                 forKey: @"Height"];
    
    // Rabbit
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: RABBIT];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithInt: N_RABBIT]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_ORIGIN_X * SCALE_X + OFFSET_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_WIDTH * RABBIT_SCALE * SCALE_X]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: RABBIT] setObject: [NSNumber numberWithDouble: RABBIT_HEIGHT * RABBIT_SCALE * SCALE_Y]
                                                    forKey: @"Height"];

    // Racoon
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: RACOON];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithInt: N_RACOON]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_ORIGIN_X * SCALE_X + OFFSET_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_WIDTH * RACOON_SCALE * SCALE_X]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: RACOON] setObject: [NSNumber numberWithDouble: RACOON_HEIGHT * RACOON_SCALE * SCALE_Y]
                                                    forKey: @"Height"];

    // Squirrel_Left
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: SQUIRREL_LEFT];
    [[animalInfoDictionary objectForKey: SQUIRREL_LEFT] setObject: [NSNumber numberWithInt: N_SQUIRREL_LEFT]
                                                    forKey: @"N"];
    [[animalInfoDictionary objectForKey: SQUIRREL_LEFT] setObject: [NSNumber numberWithDouble: SQUIRREL_LEFT_ORIGIN_X * SCALE_X + OFFSET_X]
                                                    forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: SQUIRREL_LEFT] setObject: [NSNumber numberWithDouble: SQUIRREL_LEFT_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                    forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: SQUIRREL_LEFT] setObject: [NSNumber numberWithDouble: SQUIRREL_LEFT_WIDTH * SQUIRREL_LEFT_SCALE * SCALE_X]
                                                    forKey: @"Width"];
    [[animalInfoDictionary objectForKey: SQUIRREL_LEFT] setObject: [NSNumber numberWithDouble: SQUIRREL_LEFT_HEIGHT * SQUIRREL_LEFT_SCALE * SCALE_Y]
                                                    forKey: @"Height"];

    // Squirrel_Right
    [animalInfoDictionary setObject: [NSMutableDictionary dictionaryWithCapacity: N_PROPERTY]
                             forKey: SQUIRREL_RIGHT];
    [[animalInfoDictionary objectForKey: SQUIRREL_RIGHT] setObject: [NSNumber numberWithInt: N_SQUIRREL_RIGHT]
                                                           forKey: @"N"];
    [[animalInfoDictionary objectForKey: SQUIRREL_RIGHT] setObject: [NSNumber numberWithDouble: SQUIRREL_RIGHT_ORIGIN_X * SCALE_X + OFFSET_X]
                                                           forKey: @"OriginX"];
    [[animalInfoDictionary objectForKey: SQUIRREL_RIGHT] setObject: [NSNumber numberWithDouble: SQUIRREL_RIGHT_ORIGIN_Y * SCALE_X + OFFSET_Y]
                                                           forKey: @"OriginY"];
    [[animalInfoDictionary objectForKey: SQUIRREL_RIGHT] setObject: [NSNumber numberWithDouble: SQUIRREL_RIGHT_WIDTH * SQUIRREL_RIGHT_SCALE * SCALE_X]
                                                           forKey: @"Width"];
    [[animalInfoDictionary objectForKey: SQUIRREL_RIGHT] setObject: [NSNumber numberWithDouble: SQUIRREL_RIGHT_HEIGHT * SQUIRREL_RIGHT_SCALE * SCALE_Y]
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
    movieLayer.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
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
    // MEERKAT, RABBIT, RACOON
    int n1 = [[animationStatus objectForKey: MEERKAT] intValue];
    int n2 = [[animationStatus objectForKey: RABBIT] intValue];
    int n3 = [[animationStatus objectForKey: RACOON] intValue];
    if (n1 == 0 && n2 == 0 && n3 == 0) {
        double r = (double)rand() / RAND_MAX;
        if (r > 0.6667) {
            [animationStatus setObject: [NSNumber numberWithInt: N_MEERKAT]
                                forKey: MEERKAT];
        }
        else if (r > 0.3333) {
            [animationStatus setObject: [NSNumber numberWithInt: N_RABBIT]
                                forKey: RABBIT];
        }
        else {
            [animationStatus setObject: [NSNumber numberWithInt: N_RACOON]
                                forKey: RACOON];
        }
    }
}

- (IBAction)sensor2TunrnedOn: (id)sender {
    NSLog(@"Sensor 2.");
    // SQUIRREL_LEFT
    int n = [[animationStatus objectForKey: SQUIRREL_LEFT] intValue];
    if (n == 0) {
        [animationStatus setObject: [NSNumber numberWithInt: N_SQUIRREL_LEFT]
                            forKey: SQUIRREL_LEFT];
    }
}

- (IBAction)sensor3TunrnedOn: (id)sender {
    NSLog(@"Sensor 3.");
    // BUTTERFLY_CROWD or OWL
    int n1 = [[animationStatus objectForKey: BUTTERFLY_CROWD] intValue];
    int n2 = [[animationStatus objectForKey: OWL] intValue];
    if (n1 == 0 && n2 == 0) {
        double r = (double)rand() / RAND_MAX;
        if (r > 0.5) {
            [animationStatus setObject: [NSNumber numberWithInt: N_BUTTERFLY_CROWD]
                                forKey: BUTTERFLY_CROWD];
        }
        else {
            [animationStatus setObject: [NSNumber numberWithInt: N_OWL]
                                forKey: OWL];
        }
    }
}

- (IBAction)sensor4TunrnedOn: (id)sender {
    NSLog(@"Sensor 4.");
    // SQUIRREL_RIGHT
    int n = [[animationStatus objectForKey: SQUIRREL_RIGHT] intValue];
    if (n == 0) {
        [animationStatus setObject: [NSNumber numberWithInt: N_SQUIRREL_RIGHT]
                            forKey: SQUIRREL_RIGHT];
    }
}

- (IBAction)sensor5TunrnedOn: (id)sender {
    NSLog(@"Sensor 5.");
    // BUTTERFLY
    int n = [[animationStatus objectForKey: BUTTERFLY] intValue];
    if (n == 0) {
        [animationStatus setObject: [NSNumber numberWithInt: N_BUTTERFLY]
                            forKey: BUTTERFLY];
    }
}

- (IBAction)sensor6TunrnedOn: (id)sender {
    NSLog(@"Sensor 6.");
    // DEER or FOX
    int n1 = [[animationStatus objectForKey: DEER] intValue];
    int n2 = [[animationStatus objectForKey: FOX] intValue];
    if (n1 == 0 && n2 == 0) {
        double r = (double)rand() / RAND_MAX;
        if (r > 0.5) {
            [animationStatus setObject: [NSNumber numberWithInt: N_DEER]
                                forKey: DEER];
        }
        else {
            [animationStatus setObject: [NSNumber numberWithInt: N_FOX]
                                forKey: FOX];
        }
    }
}


@end
