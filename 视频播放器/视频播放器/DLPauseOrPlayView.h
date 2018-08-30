//
//  DLPauseOrPlayView.h
//  视频播放器
//
//  Created by 丁磊 on 2018/8/30.
//  Copyright © 2018年 丁磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLCommonHeader.h"
@class DLPauseOrPlayView;
@protocol DLPauseOrPlayViewDelegate <NSObject>
@required
/**
 暂停和播放视图和状态
 
 @param pauseOrPlayView 暂停或者播放视图
 @param state 返回状态
 */
-(void)pauseOrPlayView:(DLPauseOrPlayView *)pauseOrPlayView withState:(BOOL)state;

@end
@interface DLPauseOrPlayView : UIView
@property (nonatomic,strong) UIButton *imageBtn;
@property (nonatomic,weak) id<DLPauseOrPlayViewDelegate> delegate;
@property (nonatomic,assign,readonly) BOOL state;

@end
