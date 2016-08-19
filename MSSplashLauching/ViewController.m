//
//  ViewController.m
//  MSSplashLauching
//
//  Created by mr.scorpion on 16/8/19.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()
{
    UIImageView *_bgImageView;
}
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation ViewController
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _bgImageView.image = [UIImage imageNamed:@"guide01"];
    [self.view addSubview:_bgImageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(60, self.view.frame.size.height-80, self.view.frame.size.width-120, 40);
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.layer.cornerRadius = 5.f;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"开始使用" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
}
-(void)changeImage
{
    static int index = 2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        index = index >3 ? 1:index;
        _bgImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide0%d",index]];
        index++;
        
        //创建转场动画效果
        CATransition *animation = [CATransition animation];
        //动画类型
        animation.type   = @"rippleEffect";
        
        //动画执行方向
        animation.subtype  = kCATransitionFromBottom;
        animation.duration = 3.0;
        
        [_bgImageView.layer addAnimation:animation forKey:nil];
    });
}

- (void)click
{
    [_timer invalidate];
    _timer = nil;
    ViewController1  *vc1 = [[ViewController1 alloc] init];
    [self presentViewController:vc1 animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
