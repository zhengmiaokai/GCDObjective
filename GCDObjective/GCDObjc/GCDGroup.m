//
//  GCDGroup.m
//  Basic
//
//  Created by zhengmiaokai on 2018/8/13.
//  Copyright © 2018年 zhengmiaokai. All rights reserved.
//

#import "GCDGroup.h"

@interface GCDGroup ()

@property (nonatomic, strong) dispatch_group_t group;

@end

@implementation GCDGroup

- (instancetype)init {
    self = [super init];
    if (self) {
        self.group = dispatch_group_create();
    }
    return self;
}

- (void)enter {
    dispatch_group_enter(_group);
}

- (void)leave {
    dispatch_group_leave(_group);
}

- (void)async:(dispatch_queue_t)queue block:(void (^)(void))block {
    dispatch_group_async(_group, queue, block);
}

- (void)notify:(void(^)(void))block {
    dispatch_group_notify(_group, dispatch_get_main_queue(), block);
}

- (void)wait:(NSTimeInterval)timeInterval {
    dispatch_group_wait(_group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)));
}

@end
