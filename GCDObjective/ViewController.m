//
//  ViewController.m
//  GCDObjective
//
//  Created by mikazheng on 2021/5/21.
//

#import "ViewController.h"
#import "GCDConstant.h"

@interface ViewController (){
    GCDSource *_timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* ------------------------ group ------------------------ */
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
        
    /* ------------------------ source ------------------------ */
    _timer = [[GCDSource alloc] initWithTimeInterval:3 repeats:YES timerBlock:^{
        // do something
    }];

    [_timer pauseTimer];
    [_timer resumeTimer];
    [_timer stopTimer];
        
    /* ----------------------- semaphore ----------------------- */
    GCDSemaphore *semaphore = [GCDSemaphore semaphoreWithValue:0];
    [GCDQueue asyncGlobal:^{
        // do something
        [semaphore signal];
    }];
    [semaphore wait];
    // continue after signal
    
}


@end
