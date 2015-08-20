//
//  BIDTaskDetailController.h
//  Simple Storyboard
//
//  Created by dansonliu on 15/8/18.
//  Copyright (c) 2015年 dansonliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDTaskDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) NSDictionary *selection;
@property (weak, nonatomic) id delegate;

@end
