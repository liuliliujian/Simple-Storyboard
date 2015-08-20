//
//  BIDTaskListController.m
//  Simple Storyboard
//
//  Created by dansonliu on 15/8/18.
//  Copyright (c) 2015年 dansonliu. All rights reserved.
//

#import "BIDTaskListController.h"

@interface BIDTaskListController ()
@property (strong, nonatomic) NSMutableArray *tasks;
@property (copy, nonatomic) NSDictionary *editedSelection;
@end

@implementation BIDTaskListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [@[@"Walk the dog",
                   @"URGENT: Buy milk",
                   @"Clean hidden lair",
                   @"Invent miniature dolphins",
                   @"Find new henchmen",
                   @"Get revenge on do-gooder heroes",
                   @"URGENT: Fold laundry",
                   @"Hold entire world hostage",
                   @"Manicure"] mutableCopy];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setEditedSelection:(NSDictionary *) dict {
    if (![dict isEqual:self.editedSelection]) {
        _editedSelection = dict;
        NSIndexPath *indexPath = dict[@"indexPath"];
        id newValue = dict[@"object"];
        [self.tasks replaceObjectAtIndex:indexPath.row withObject:newValue];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"prepare for segue.");
    UIViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setDelegate:)]) {
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        id object = self.tasks[indexPath.row];
        NSDictionary *selection = @{@"indexPath" : indexPath, @"object" : object};
        [destination setValue:selection forKey:@"selection"];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = nil;
    NSString *task = [self.tasks objectAtIndex:indexPath.row];
    NSRange urgentRange = [task rangeOfString:@"URGENT" options: NSCaseInsensitiveSearch];
    if (urgentRange.location == NSNotFound) {
        identifier = @"plainCell";
    } else {
        identifier = @"attentionCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    NSMutableAttributedString *richTask = [[NSMutableAttributedString alloc] initWithString:task];
    NSDictionary *urgentAttrs = @{NSFontAttributeName : [UIFont fontWithName:@"Courier" size:24], NSStrokeWidthAttributeName : @3.0};
    [richTask setAttributes:urgentAttrs range:urgentRange];
    cellLabel.attributedText = richTask;
    return cell;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@, %@", self.navigationController.navigationItem.leftBarButtonItems, self.navigationController.navigationItem.backBarButtonItem);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"table did selected...");
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    [self.navigationItem.leftBarButtonItem];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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

@end
