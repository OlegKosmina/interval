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
    CALayer *imageLayer;
}

@property (assign) IBOutlet NSView *view;

- (IBAction)sensor1TunrnedOn: (id)sender;

@end
