# GCDObjective
## GCD的封装，包含异步调用、Group、同步锁、Source、Semaphore

### 调用示例
```objective-c
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

```
