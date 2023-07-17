//
//  GCDGroup.h
//  Basic
//
//  Created by zhengmiaokai on 2018/8/13.
//  Copyright © 2018年 zhengmiaokai. All rights reserved.
//

/*---------------------------------------------
 不限于"并行队列"，"同一串行队列"或者"不同串行队列"也可以
 ---------------------------------------------*/

#import <Foundation/Foundation.h>

@interface GCDGroup : NSObject

- (void)enter; // +1，为0时触发notify

- (void)leave; // -1，为0时触发notify

- (void)async:(dispatch_queue_t)queue block:(void (^)(void))block; // 异步执行

- (void)notify:(void(^)(void))block; // 回调到主线程

- (void)wait:(NSTimeInterval)timeInterval; //类似于sleep(2)阻塞线程，随着enter->leave失效

@end

/* 示例
 -------------------------------------------------------------------------
 GCDGroup *group = [[GCDGroup alloc] init];
 
 [group async:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:^{
     // group task 1
 }];
 
 [group async:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:^{
     // group task 2
 }];
 
 [group notify:^{
     // group finish
 }];
 -------------------------------------------------------------------------
 */
