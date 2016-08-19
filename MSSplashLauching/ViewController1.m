//
//  ViewController1.m
//  MSSplashLauching
//
//  Created by mr.scorpion on 16/8/19.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@end

@implementation ViewController1
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
