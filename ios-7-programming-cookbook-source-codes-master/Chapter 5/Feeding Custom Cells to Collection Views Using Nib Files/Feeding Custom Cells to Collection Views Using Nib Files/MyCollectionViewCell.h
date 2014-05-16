//
//  MyCollectionViewCell.h
//  Feeding Custom Cells to Collection Views Using Nib Files
//
//  Created by Vandad NP on 02/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewBackgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *NoteName;
@property (weak, nonatomic) IBOutlet UILabel *NoteQualities;

@end
