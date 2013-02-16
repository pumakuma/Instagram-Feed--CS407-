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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create new SBJSON parser object
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    NSString *myURL = @"http://cs.wisc.edu/~griepent/instagram.json";
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfItemsInSection:(NSInteger)section
{
    return [[self.instagramData valueForKey:@"data"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"ImageCell";
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];// forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:[[[self.images valueForKey:@"thumbnail"] valueForKey:@"url"] objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:]]];
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowFullImage"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        FullSizeImageViewController *fullSizeImageViewController = [segue destinationViewController];
        fullSizeImageViewController.imageCaption = [self.caption objectAtIndex:indexPath.row];
        fullSizeImageViewController.imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[[self.images valueForKey:@"standard_resolution"] valueForKey:@"url"] objectAtIndex:indexPath.row]]];
    }
}

@end
