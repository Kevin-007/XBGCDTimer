
#import <Foundation/Foundation.h>

@class XBGCDTimer;
typedef void (^XBGCDTimerCallbackBlock)(XBGCDTimer *timer);

@interface XBGCDTimer : NSObject

/// Create GCDTimer, but not fire（定时器创建但未启动）
/// @param start The number of seconds between timer first times callback since  fire
/// @param interval The number of seconds between firings of the timer
/// @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated
/// @param queue Queue for timer run and callback,  default is in  main queue
/// @param block Timer callback handler
+ (XBGCDTimer *)xb_GCDTimerWithSartTime:(NSTimeInterval)start
                               interval:(NSTimeInterval)interval
                                  queue:(dispatch_queue_t)queue
                                repeats:(BOOL)repeats
                                  block:(XBGCDTimerCallbackBlock)block;


/// Create GCDTimer and fire immdiately （定时器创建后马上启动）
/// @param start The number of seconds between timer first times callback since  fire
/// @param interval The number of seconds between firings of the timer
/// @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated
/// @param queue Queue for timer run and callback,  default is in  main queue
/// @param block Timer callback handler
+ (XBGCDTimer *)xb_scheduledGCDTimerWithSartTime:(NSTimeInterval)start
                                        interval:(NSTimeInterval)interval
                                           queue:(dispatch_queue_t)queue
                                         repeats:(BOOL)repeats
                                           block:(XBGCDTimerCallbackBlock)block;


/// Create GCDTimer, but not fire（定时器创建但未启动）
/// @param target target description
/// @param selector selector description
/// @param start The number of seconds between firings of the timer
/// @param interval The number of seconds between firings of the timer
/// @param queue Queue for timer run and callback,  default is in  main queue
/// @param repeats If YES, the timer will repeatedly reschedule itself until invalidated
+ (XBGCDTimer *)xb_GCDTimerWithTarget:(id)target
                             selector:(SEL)selector
                             SartTime:(NSTimeInterval)start
                             interval:(NSTimeInterval)interval
                                queue:(dispatch_queue_t)queue
                              repeats:(BOOL)repeats;


/// Create GCDTimer and fire immdiately （定时器创建后马上启动）
/// @param target target description
/// @param selector selector description
/// @param start The number of seconds between timer first times callback since  fire
/// @param interval The number of seconds between firings of the timer
/// @param repeats  If YES, the timer will repeatedly reschedule itself until invalidated
/// @param queue Queue for timer run and callback,  default is in  main queue
+ (XBGCDTimer *)xb_scheduledGCDTimerWithTarget:(id)target
                                      selector:(SEL)selector
                                      SartTime:(NSTimeInterval)start
                                      interval:(NSTimeInterval)interval
                                         queue:(dispatch_queue_t)queue
                                       repeats:(BOOL)repeats;


/** start*/
- (void)fire;

/** stop*/
- (void)invalidate;
@end

