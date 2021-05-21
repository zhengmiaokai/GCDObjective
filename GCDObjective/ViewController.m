//
//  ViewController.m
//  GCDObjective
//
//  Created by mikazheng on 2021/5/21.
//

#import "ViewController.h"
#import "GCDConstant.h"

@interface ViewController ()
 
@property (nonatomic, strong) GCDGroup* group;
@property (nonatomic, strong) GCDSource* source;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GCDSemaphore* gcd_semaphore = [GCDSemaphore semaphore];

    [GCDQueue asyncGlobal:^{
        
        [gcd_semaphore wait];
        // sleep(3);
        [gcd_semaphore signal];
    }];
    
    // sleep(2);
    
    [gcd_semaphore wait];
    
    [gcd_semaphore signal];
    
    
    self.group = [[GCDGroup alloc] init];
    
    [_group asyncQueue:dispatch_queue_create("222", DISPATCH_QUEUE_SERIAL) block:^{
         sleep(2);
    }];
    
    [_group asyncQueue:dispatch_queue_create("111", DISPATCH_QUEUE_SERIAL) block:^{
         sleep(3);
    }];
    
    [_group notify:^{
    
    }];
    
    
    self.source = [[GCDSource alloc] initWithTimeInterval:3 repeats:YES timerBlock:^{
        
    }];
}


@end
