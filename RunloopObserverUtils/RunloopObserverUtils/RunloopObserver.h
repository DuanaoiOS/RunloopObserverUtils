//
//  RunloopObserver.h
//  RunloopObserverUtils
//
//  Created by DuanAo on 17/4/21.
//  Copyright © 2017年 DA. All rights reserved.
//

#import <Foundation/Foundation.h>

//主要用来告诉对象runloop回调了可以在此间隙做耗时操作
@protocol RunloopObserverDelegate <NSObject>

@optional

- (void)runloopObserverDidCallBack;

@end

@interface RunloopObserver : NSObject

+ (NSTimer *)addRunloopObserVer:(id<RunloopObserverDelegate>)obj;

@end
