//
//  ProgressCollectionViewCell.h
//  CollectionCellBadAccess
//
//  Created by George Brown on 13.10.17.
//  Copyright © 2017 Serious Cyrus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressObject.h"

@interface ProgressCollectionViewCell : UICollectionViewCell

@property (nullable, nonatomic) ProgressObject *progressObject;

@property (nullable, weak, nonatomic) IBOutlet UIProgressView *progressView;

@end
