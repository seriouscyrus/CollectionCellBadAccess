//
//  CollectionViewController.m
//  CollectionCellBadAccess
//
//  Created by George Brown on 13.10.17.
//  Copyright © 2017 Serious Cyrus. All rights reserved.
//

#import "CollectionViewController.h"
#import "AppDelegate.h"
#import "ProgressCollectionViewCell.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[ProgressCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UINib *nib = [UINib nibWithNibName:@"ProgressCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"progressCell"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Uncomment to make it work, but it's not always ideal, but then coming back from navigation, everything is unset
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSArray *objects = [(AppDelegate *)[UIApplication sharedApplication].delegate progressObjects];
    for (NSInteger i = 0; i < objects.count; i++) {
        ProgressCollectionViewCell *cell = (ProgressCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        cell.progressObject = nil;
    }
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [(AppDelegate *)[UIApplication sharedApplication].delegate progressObjects].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProgressCollectionViewCell *cell = (ProgressCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"progressCell" forIndexPath:indexPath];
    // Configure the cell
    cell.progressObject = [(AppDelegate *)[UIApplication sharedApplication].delegate progressObjects][indexPath.item];
    //cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showViewController" sender:self];
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
