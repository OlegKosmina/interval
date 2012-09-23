//
//  INTController.h
//  Interval
//
//  Created by Ichi Kanaya on 22/09/2012.
//  Copyright (c) 2012 Ichi Kanaya. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

@interface INTController: NSObject {
    CALayer *backgroundLayer;
    /// CALayer *imageLayer;
    NSArray *animalNameArray;
    NSMutableDictionary *animalInfoDictionary;
    NSMutableDictionary *animationStatus;
    NSMutableDictionary *animationLayers;
    NSMutableArray *rabbitLayers;  // to be removed
    NSMutableArray *currentVisibleImageLayers;  // holds temporary layers
    NSTimer *timer;
}

@property (assign) IBOutlet NSView *view;

- (IBAction)sensor1TunrnedOn: (id)sender;
- (IBAction)sensor2TunrnedOn: (id)sender;
- (IBAction)sensor3TunrnedOn: (id)sender;
- (IBAction)sensor4TunrnedOn: (id)sender;
- (IBAction)sensor5TunrnedOn: (id)sender;
- (IBAction)sensor6TunrnedOn: (id)sender;

@end
