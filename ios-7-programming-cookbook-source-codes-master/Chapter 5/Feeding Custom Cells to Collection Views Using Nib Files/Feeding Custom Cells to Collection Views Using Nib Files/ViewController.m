//
//  ViewController.m
//  Providing a Flow Layout to a Collection View
//
//  Created by Vandad NP on 02/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"

static NSString *kCollectionViewCellIdentifier = @"Cells";

@implementation ViewController

- (NSArray *) allImages{
    
    static NSArray *AllSectionImages = nil;
    
    if (AllSectionImages == nil){
        AllSectionImages = @[
                             [UIImage imageNamed:@"1"],
                             [UIImage imageNamed:@"2"],
                             [UIImage imageNamed:@"3"]
                             ];
    }
    
    return AllSectionImages;
    
}

- (UIImage *) randomImage{
    return [self allImages][arc4random_uniform([self allImages].count)];
}

- (instancetype) initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil){
        /* Register the nib with the collection view for easy retrieval */
        UINib *nib = [UINib nibWithNibName:
                      NSStringFromClass([MyCollectionViewCell class])
                                    bundle:[NSBundle mainBundle]];
        
        [self.collectionView registerNib:nib
              forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
    }
    return self;
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.measureContent = [NSMutableArray array];
    
    for ( int i= 0; i < 64; i++ ) {
        [self.measureContent addObject:@""];
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView
            :(UICollectionView *)collectionView{
    /* Between 3 to 6 sections */
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    /* Each section has between 10 to 15 cells */
    return 64;//10 + arc4random_uniform(6);
}

- (void)    collectionView:(UICollectionView *)collectionView
  didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *selectedCell=
    (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    selectedCell.NoteName.text = @"?";
    [self.measureContent replaceObjectAtIndex:indexPath.row
                                   withObject:@"?"];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell =
    [collectionView
     dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier
     forIndexPath:indexPath];
    cell.NoteName.text = _measureContent[indexPath.row];
    NSLog(@"measure:%d content:%@",indexPath.row,_measureContent[indexPath.row]);
    
    return cell;
    
}

@end
