//
//  LSITipController.h
//  Tips
//
//  Created by Alex Shillingford on 5/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSITip;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

@property (nonatomic, readonly, copy) NSArray<LSITip *> *tips;
@property (nonatomic, readonly) NSUInteger tipCount;

- (void)addTip:(LSITip *)aTip;

- (LSITip *)tipAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
