//
//  CommentTableViewController.m
//  iPhoneLab
//
//  Created by Brian Anderson on 2/14/13.
//  Copyright (c) 2013 Brian Anderson. All rights reserved.
//

#import "CommentTableViewController.h"

@interface CommentTableViewController ()

@end

@implementation CommentTableViewController

@synthesize imageComments;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //NSLog(@"Comments: %@",self.imageComments);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger numberRows = [self.imageComments count];
    if (numberRows == 0)
        numberRows = 1;
    return numberRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CommentCell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if ([self.imageComments count] > 0) {
        cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
        cell.imageView.imageURL = [NSURL URLWithString:[[[self.imageComments objectAtIndex:indexPath.row] valueForKey:@"from"] valueForKey:@"profile_picture"]];
        cell.commenter.text = [[[self.imageComments objectAtIndex:indexPath.row] valueForKey:@"from"] valueForKey:@"full_name"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[[self.imageComments objectAtIndex:indexPath.row] valueForKey:@"created_time"] doubleValue]];
        NSString *dateString = [NSDateFormatter localizedStringFromDate:date
                                dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
        cell.commentDate.text = dateString;
        cell.commentText.text = [[self.imageComments objectAtIndex:indexPath.row] valueForKey:@"text"];
    } else {
        cell.commenter.text = @"No comments found...";
        cell.commentDate.text = @"";
        cell.commentText.text = @"";
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
