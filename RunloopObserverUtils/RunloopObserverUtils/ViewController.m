//
//  ViewController.m
//  RunloopObserverUtils
//
//  Created by DuanAo on 17/4/21.
//  Copyright © 2017年 DA. All rights reserved.
//

#import "ViewController.h"
#import "RunloopObserver.h"

@interface ViewController ()<RunloopObserverDelegate>

@property (nonatomic, weak  ) NSTimer *timer;


@end

@implementation ViewController

//在不用的时候记得销毁定时器
- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timer = [RunloopObserver addRunloopObserVer:self];
}

#pragma mark - RunloopObserverDelegate

//把耗时任务放到这里做
- (void)runloopObserverDidCallBack
{
    
}

@end
