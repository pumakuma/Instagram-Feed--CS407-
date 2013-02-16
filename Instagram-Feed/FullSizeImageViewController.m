//
//  FullSizeImageViewController.m
//  iPhoneLab
//
//  Created by Brian Anderson on 1/30/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import "FullSizeImageViewController.h"

@interface FullSizeImageViewController ()
@end

@implementation FullSizeImageViewController

@synthesize imageURL;
@synthesize imageCaption;
@synthesize imageComments;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"placeholder.png"];
    self.imageView.imageURL = self.imageURL;
    self.imageView.frame = self.scrollView.bounds;
    //self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //self.scrollView.clipsToBounds = YES;
    //[self.imageView sizeToFit];
    //self.scrollView.contentSize = CGSizeMake(self.imageView.frame.size.width, self.imageView.frame.size.height);
    //self.scrollView.contentMode = UIViewContentModeCenter;
    self.scrollView.minimumZoomScale= 1.0;
    self.scrollView.maximumZoomScale= 4.0;
    self.scrollView.delegate=self;
    self.imageLabel.text = [self.imageCaption valueForKey:@"text"];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"Segue: %@",[segue identifier]);
    if ([[segue identifier] isEqualToString:@"ShowComments"])
    {
        //NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        CommentTableViewController *commentTableViewController = [segue destinationViewController];
        commentTableViewController.imageComments = self.imageComments;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
