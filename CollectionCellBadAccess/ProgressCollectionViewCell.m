//
//  ProgressCollectionViewCell.m
//  CollectionCellBadAccess
//
//  Created by George Brown on 13.10.17.
//  Copyright © 2017 Serious Cyrus. All rights reserved.
//

#import "ProgressCollectionViewCell.h"

@implementation ProgressCollectionViewCell

- (void) prepareForReuse
{
    NSLog(@"PrepareForReuse %@", self);
    self.progressObject = nil;
}

- (void) setProgressObject:(ProgressObject *)progressObject
{
    if (_progressObject) {
        // Remove observer
        [_progressObject removeObserver:self forKeyPath:@"progress"];
    }
    _progressObject = progressObject;
    if (_progressObject) {
        // Add observer;
        [_progressObject addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"progress"]) {
        // Either we need to tell if we're visible, or have an outside agent know when to add and remove observers
        //NSLog(@"Progress view : %@", self.progressView);
        self.progressView.progress = self.progressObject.progress;
    }
}

@end
