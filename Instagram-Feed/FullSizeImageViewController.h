//
//  FullSizeImageViewController.h
//  iPhoneLab
//
//  Created by Brian Anderson on 1/30/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView/AsyncImageView.h"
#import "CommentTableViewController.h"

@interface FullSizeImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSMutableArray *imageCaption;
@property (nonatomic, strong) NSMutableArray *imageComments;

@end
