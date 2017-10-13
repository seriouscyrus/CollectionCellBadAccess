//
//  AppDelegate.h
//  CollectionCellBadAccess
//
//  Created by George Brown on 13.10.17.
//  Copyright © 2017 Serious Cyrus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressObject.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly)   NSArray <ProgressObject *> *progressObjects;

@end

