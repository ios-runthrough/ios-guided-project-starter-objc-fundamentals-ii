//
//  LSITipController.m
//  Tips
//
//  Created by Alex Shillingford on 5/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

@interface LSITipController () {
    NSMutableArray *_internalTips;
}

@end

@implementation LSITipController

- (instancetype)init
{
    if (self = [super init]) {
        _internalTips = [[NSMutableArray alloc] init];
        
#ifdef DEBUG
        // FIXME: Test Mode (Remove for production)
#pragma message "Ball so hard mufuggahs wanna fine me"
        [self addTestData];
#endif
    }
    return self;
}

- (void)addTestData
{
    LSITip *aTip = [[LSITip alloc] initWithname:@"Sushi"
                                          total:200.00
                                     splitCount:4
                                  tipPercentage:20.0];
    [_internalTips addObject:aTip];
    
    [_internalTips addObject:[[LSITip alloc] initWithname:@"Pizza"
                                                    total:30.
                                               splitCount:8
                                            tipPercentage:25.]];
}

#pragma mark - Convenience Accessors

- (NSArray<LSITip *> *)tips
{
    return _internalTips.copy;
}

- (NSUInteger)tipCount
{
    return _internalTips.count;
}

- (LSITip *)tipAtIndex:(NSUInteger)index
{
    return [_internalTips objectAtIndex:index];
}

- (void)addTip:(LSITip *)aTip
{
    [_internalTips addObject:aTip];
}

@end
