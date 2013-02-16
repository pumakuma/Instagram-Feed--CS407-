//
//  ViewController.h
//  iPhoneLab
//
//  Created by Brian Anderson on 1/30/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "json-framework/SBJson.h"
#import "AsyncImageView/AsyncImageView.h"
#import "ImageCell.h"
#import "FullSizeImageViewController.h"

@interface ViewController : UICollectionViewController

@property (strong,nonatomic) NSArray *instagramData;
@property (strong,nonatomic) NSMutableArray *images;
@property (strong,nonatomic) NSMutableArray *caption;
@property (strong,nonatomic) NSMutableArray *comments;

@end
