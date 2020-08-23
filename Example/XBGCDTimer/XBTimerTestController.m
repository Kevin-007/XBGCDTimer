//
//  XBTimerTestController.m
//  XBTimer_Example
//
//  Created by Kevin on 2020/8/21.
//  Copyright © 2020 Aniyang. All rights reserved.
//

#import "XBTimerTestController.h"

#import <XBGCDTimer/XBGCDTimer.h>

@interface XBTimerTestController ()

//XBGCDTimer
/**GCD timer1*/
@property (nonatomic, strong) XBGCDTimer *gcdTimer1;
/**GCD  timer2*/
@property (nonatomic, strong) XBGCDTimer *gcdTimer2;
/**GCD  timer3*/
@property (nonatomic, strong) XBGCDTimer *gcdTimer3;
/**GCD  timer4*/
@property (nonatomic, strong) XBGCDTimer *gcdTimer4;

@end

@implementation XBTimerTestController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self test_XBGCDTimer];

}

- (void)test_XBGCDTimer{
    //main queue, NO repeats
    NSLog(@"gcdTimer1 start");
    _gcdTimer1 = [XBGCDTimer xb_GCDTimerWithSartTime:0 interval:0 queue:nil repeats:NO block:^(XBGCDTimer * _Nonnull timer) {
        NSLog(@"gcdTimer1,%@", [NSThread currentThread]);
    }];
    
    //need fire
    [_gcdTimer1 fire];
    
    
    //global queue, repeats
    NSLog(@"gcdTimer2 start");
    _gcdTimer2 = [XBGCDTimer xb_scheduledGCDTimerWithSartTime:2 interval:1 queue:dispatch_get_global_queue(0, 0) repeats:YES block:^(XBGCDTimer *timer) {
        NSLog(@"gcdTimer2,%@", [NSThread currentThread]);
    }];
    
    
    //global queue, repeats
    NSLog(@"gcdTimer3 start");
    _gcdTimer3 = [XBGCDTimer xb_GCDTimerWithTarget:self selector:@selector(gcdTimerAction1) SartTime:0 interval:2 queue:dispatch_get_global_queue(0, 0) repeats:YES];

    //need fire
    [_gcdTimer3 fire];

    //main queue, NO repeats
    NSLog(@"gcdTimer4 start");
    _gcdTimer4 = [XBGCDTimer xb_scheduledGCDTimerWithTarget:self selector:@selector(gcdTimerAction2) SartTime:6 interval:1 queue:dispatch_get_main_queue() repeats:NO];
    
}

#pragma mark - Event for GCDTimer
- (void)gcdTimerAction1{
    NSLog(@"%s", __func__);
}

- (void)gcdTimerAction2{
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    
    [self.gcdTimer1 invalidate];
    [self.gcdTimer2 invalidate];
    [self.gcdTimer3 invalidate];
    [self.gcdTimer4 invalidate];
}

@end
