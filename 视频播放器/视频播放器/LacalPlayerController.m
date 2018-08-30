//
//  LacalPlayerController.m
//  视频播放器
//
//  Created by 丁磊 on 2018/8/30.
//  Copyright © 2018年 丁磊. All rights reserved.
//

#import "LacalPlayerController.h"
#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LacalPlayerController ()
@property (nonatomic, strong) UIButton *btn;
@property (strong, nonatomic) AVPlayerViewController *playerVC;
@end

@implementation LacalPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建URL
    NSString *str = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:str];
    //直接创建AVPlayer，它内部也是先创建AVPlayerItem，这个只是快捷方法
    AVPlayer *player = [AVPlayer playerWithURL:url];
    //创建AVPlayerViewController控制器
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    playerVC.player = player;
    playerVC.view.frame = self.view.frame;
    [self.view addSubview:playerVC.view];
    self.playerVC = playerVC;
    //调用控制器的属性player的开始播放方法
    [self.playerVC.player play];
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 30, 50, 50)];
//    self.btn.backgroundColor = [UIColor redColor];
    [self.btn setTitle:@"返回" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view.
}

- (void)didClick:(UIButton *)button{
    ViewController *vc = [[ViewController alloc]init];
    //    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc  animated:YES completion:nil];
    [self.playerVC.player pause];
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
