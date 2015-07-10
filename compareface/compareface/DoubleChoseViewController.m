//
//  SingChoseViewController.m
//  compareface
//
//  Created by qiao on 15/6/5.
//  Copyright (c) 2015年 qiao. All rights reserved.
//

#import "DoubleChoseViewController.h"
#import "AppDelegate.h"


#import "APIKeyAndAPISecret.h"

@implementation DoubleChoseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

   
}
-(void)addmessage
{
    UIFont *font = [UIFont fontWithName:@"MGentleHKS" size:21];
   
    CGRect rect=CGRectMake(kSCREEN_WIDTH/2-50, 60.0f, 100.0f, 30.0f);
    UILabel *titleLable=[[UILabel alloc] initWithFrame:rect];
    [titleLable setText:@"夫妻相"];
    [titleLable setFont:font];
    titleLable.textColor=mainColor;
    [self.view addSubview:titleLable];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
