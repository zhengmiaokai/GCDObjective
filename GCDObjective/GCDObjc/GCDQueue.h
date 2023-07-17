//
//  GCDQueue.h
//  Basic
//
//  Created by zhengmiaokai on 2018/8/13.
//  Copyright © 2018年 zhengmiaokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject

+ (void)async:(dispatch_queue_t)queue block:(void(^)(void))block;

+ (void)sync:(dispatch_queue_t)queue block:(void(^)(void))block;

+ (void)asyncGlobal:(void(^)(void))block;

+ (void)asyncMain:(void(^)(void))block;

+ (void)barrierAsync:(dispatch_queue_t)queue block:(void(^)(void))block;

+ (void)barrierSync:(dispatch_queue_t)queue block:(void(^)(void))block;

+ (void)delay:(NSTimeInterval)timeInterval block:(void(^)(void))block;

@end
