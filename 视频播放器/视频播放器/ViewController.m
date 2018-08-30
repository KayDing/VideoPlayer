//
//  ViewController.m
//  视频播放器
//
//  Created by 丁磊 on 2018/8/30.
//  Copyright © 2018年 丁磊. All rights reserved.
//

#import "ViewController.h"
#import "DLPlayer.h"
#import "LacalPlayerController.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) DLPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化播放器
    self.player = [[DLPlayer alloc]initWithUrl:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]];
    //设置标题
    [self.player setTitle:@"这是一个标题"];
    //设置播放器背景颜色
    self.player.backgroundColor = [UIColor blackColor];
    //设置播放器填充模式 默认SBLayerVideoGravityResizeAspectFill，可以不添加此语句
    self.player.mode = DLLayerVideoGravityResizeAspectFill;
    //添加播放器到视图
    [self.view addSubview:self.player];
    //约束，也可以使用Frame
    [self.player mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.mas_equalTo(@250);
    }];
    
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 500, 50, 50)];
    self.btn.backgroundColor = [UIColor redColor];
    [self.btn setTitle:@"点我" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didClick:(UIButton *)button{
    LacalPlayerController *vc = [[LacalPlayerController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc  animated:YES completion:nil];
    [self.player pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
