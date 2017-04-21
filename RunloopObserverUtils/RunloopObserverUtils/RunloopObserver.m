//
//  RunloopObserver.m
//  RunloopObserverUtils
//
//  Created by DuanAo on 17/4/21.
//  Copyright © 2017年 DA. All rights reserved.
//

#import "RunloopObserver.h"

//回调函数
static void runloopCallBackFunc(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    
    id<RunloopObserverDelegate>obj = (__bridge id<RunloopObserverDelegate>)(info);
    if ([obj respondsToSelector:@selector(runloopObserverDidCallBack)]) {
        [obj runloopObserverDidCallBack];
    }
}

@implementation RunloopObserver

//会返回一个NStimer 用于激活default模式下的runloop 调用者注意销毁
//添加一个遵从RunloopObserverDelegate协议的对象
+ (NSTimer *)addRunloopObserVer:(id<RunloopObserverDelegate>)obj
{
    CFRunLoopRef runloopRef = CFRunLoopGetCurrent(); //获取当前的runloop
    
    //创建观察者上下文
    CFRunLoopObserverContext ctx = {
      0,
    (__bridge void *)(obj),
        &CFRetain,
        &CFRelease,
        NULL
    };
    
    static CFRunLoopObserverRef runloopObserver; //定义静态runloop观察者
    runloopObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopAfterWaiting, YES, 0, &runloopCallBackFunc, &ctx);
    
    //添加观察者到runloop中 mode使用占位符 同时可以监听默认和UI
    CFRunLoopAddObserver(runloopRef, runloopObserver, kCFRunLoopCommonModes);
    
    CFRelease(runloopObserver);//释放指针
    
    return  [self setupTimer];
}

+ (NSTimer *)setupTimer
{
    return [NSTimer scheduledTimerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
    }];
}

@end
