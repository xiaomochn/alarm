//
//  ViewController.m
//  compareface
//
//  Created by qiao on 15/6/5.
//  Copyright (c) 2015年 qiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<MAOFlipViewControllerDelegate>
@property (nonatomic) MAOFlipViewController *flipViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.flipViewController = [[MAOFlipViewController alloc]init];
    self.flipViewController.delegate = self;
    [self addChildViewController:self.flipViewController];
    self.flipViewController.view.frame = self.view.frame;
    [self.view addSubview:self.flipViewController.view];
    [self.flipViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController*)flipViewController:(MAOFlipViewController *)flipViewController contentIndex:(NSUInteger)contentIndex
{
    //新規作成
    UIViewController *c;
    if (contentIndex==0)
    {
            c = [self.storyboard instantiateViewControllerWithIdentifier:@"SingChoseViewController"];
    }
    else if (contentIndex==1)
    {
          c = [self.storyboard instantiateViewControllerWithIdentifier:@"DoubleChoseViewController"];
    }
    return c;
}
- (NSUInteger)numberOfFlipViewControllerContents
{
    return 2;
}

@end
