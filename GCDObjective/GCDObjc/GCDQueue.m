//
//  GCDQueue.m
//  Basic
//
//  Created by zhengmiaokai on 2018/8/13.
//  Copyright © 2018年 zhengmiaokai. All rights reserved.
//

#import "GCDQueue.h"

@implementation GCDQueue

+ (void)async:(dispatch_queue_t)queue block:(void(^)(void))block {
    dispatch_async(queue, block);
}

+ (void)sync:(dispatch_queue_t)queue block:(void(^)(void))block {
    dispatch_sync(queue, block);
}

+ (void)asyncGlobal:(void(^)(void))block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+ (void)asyncMain:(void(^)(void))block {
    if (!block) return;
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+ (void)barrierAsync:(dispatch_queue_t)queue block:(void(^)(void))block {
    dispatch_barrier_async(queue, block);
}

+ (void)barrierSync:(dispatch_queue_t)queue block:(void(^)(void))block {
    dispatch_barrier_sync(queue, block);
}

+ (void)delay:(NSTimeInterval)timeInterval block:(void(^)(void))block {
    if (!block) return;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}

@end
