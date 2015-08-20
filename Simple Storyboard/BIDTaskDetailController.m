//
//  BIDTaskDetailController.m
//  Simple Storyboard
//
//  Created by dansonliu on 15/8/18.
//  Copyright (c) 2015年 dansonliu. All rights reserved.
//

#import "BIDTaskDetailController.h"

@interface BIDTaskDetailController ()

@end

@implementation BIDTaskDetailController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"init task detail controller0");
    return [super initWithCoder:aDecoder];
}

-(instancetype)init
{
    NSLog(@"init task detail controller1");
    return [super init];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"init task detail controller");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.text = self.selection[@"object"];
    [self.textView becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ([self.delegate respondsToSelector:@selector(setEditedSelection:)]) {
        [self.textView endEditing:YES];
        NSIndexPath *indexPath = self.selection[@"indexPath"];
        id object = self.textView.text;
        NSDictionary *editedSelection = @{@"indexPath": indexPath, @"object" : object};
        [self.delegate setValue:editedSelection forKey:@"editedSelection"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
