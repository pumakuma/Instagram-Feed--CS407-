//
//  ViewController.m
//  iPhoneLab
//
//  Created by Brian Anderson on 1/30/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize instagramData;
@synthesize images;
@synthesize caption;
@synthesize comments;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create new SBJSON parser object
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    /*NSURL *instagramURL = [NSURL URLWithString:@"https://instagram.com/oauth/authorize/?client_id=15d23fcd1a30437b8ff4735e2bd2d3ad&redirect_uri=https://api.instagram.com/v1/users/2546353/media/recent/&response_type=token"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        NSLog(@"canOpenUrl");
        [[UIApplication sharedApplication] openURL:instagramURL];
    }*/
    
    NSString *myURL = @"https://api.instagram.com/v1/users/2546353/media/recent/?access_token=307773557.15d23fc.4db51734f74a45948b8854582f58dd70"; //@"http://cs.wisc.edu/~griepent/instagram.json";
    // Prepare URL request to download statuses from Twitter
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:myURL]];
    
    // Perform request and get JSON back as a NSData object
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // Get JSON as a NSString from NSData response
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    //Print contents of json-string
    self.instagramData = [parser objectWithString:json_string];
    self.images = [[self.instagramData valueForKey:@"data"] valueForKey:@"images"];
    self.caption = [[self.instagramData valueForKey:@"data"] valueForKey:@"caption"];
    self.comments = [[self.instagramData valueForKey:@"data"] valueForKey:@"comments"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.instagramData valueForKey:@"data"] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"ImageCell";
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
    cell.imageView.imageURL = [NSURL URLWithString:[[[self.images valueForKey:@"thumbnail"] valueForKey:@"url"] objectAtIndex:indexPath.row]];
    //[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[self.images valueForKey:@"thumbnail"] valueForKey:@"url"] objectAtIndex:indexPath.row]]]];
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowFullImage"])
    {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        FullSizeImageViewController *fullSizeImageViewController = [segue destinationViewController];
        fullSizeImageViewController.imageCaption = [self.caption objectAtIndex:indexPath.row];
        fullSizeImageViewController.imageComments = [[self.comments objectAtIndex:indexPath.row] valueForKey:@"data"];
        fullSizeImageViewController.imageURL = [NSURL URLWithString:[[[self.images valueForKey:@"standard_resolution"] valueForKey:@"url"] objectAtIndex:indexPath.row]];
    }
}

@end
