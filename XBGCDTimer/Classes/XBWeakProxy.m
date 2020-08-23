
#import "XBWeakProxy.h"

@implementation XBWeakProxy
+ (instancetype)timerProxyWithTarget:(id)target{
    
    if (!target) return nil;
    
    XBWeakProxy *proxy = [XBWeakProxy alloc];
    proxy.target = target;
    
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
   return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}
@end
