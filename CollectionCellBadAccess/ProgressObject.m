//
//  ProgressObject.m
//  CollectionCellBadAccess
//
//  Created by George Brown on 13.10.17.
//  Copyright © 2017 Serious Cyrus. All rights reserved.
//

#import "ProgressObject.h"

@interface ProgressObject ()

@property (nonatomic) float     progress;
@property (nonatomic) NSTimer   *timer;

@end

@implementation ProgressObject

- (instancetype) init
{
    self = [super init];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(updateProgress)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return self;
}

- (void) updateProgress
{
    if ([NSThread mainThread] != [NSThread currentThread]) {
        NSLog(@"Wrong thread!");
    }
    self.progress = fmodf(self.progress + 0.1, 1.0);
}

@end
