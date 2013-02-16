//
//  CommentCell.h
//  iPhoneLab
//
//  Created by Brian Anderson on 2/14/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView/AsyncImageView.h"

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentDate;
@property (weak, nonatomic) IBOutlet UILabel *commentText;
@property (weak, nonatomic) IBOutlet UILabel *commenter;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
