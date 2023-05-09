# GCDObjective
## GCD的封装，包含异步调用、Group、同步锁、Source、Semaphore

### 具体调用参考ViewController
```objective-c
GCDSemaphore* semaphore = [GCDSemaphore semaphore];

[GCDQueue asyncGlobal:^{
    [semaphore wait];
    // sleep(3);
    [semaphore signal];
}];

[GCDQueue asyncGlobal:^{
    [semaphore wait];
    // sleep(2);
    [semaphore signal];
}];
    
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
```
