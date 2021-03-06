//
//  LSITip.h
//  Tips
//
//  Created by Alex Shillingford on 5/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITip : NSObject

// readonly is the same as marking something as `let` in swift. ALSO `let` in structs is why you're running into issues decoding to structs in swift
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) double total;
@property (nonatomic, readonly) NSInteger splitCount;
@property (nonatomic, readonly) double tipPercentage;

// init(name: String, total: Double, splitCount: Int, tipPercentage: Double) {}
- (instancetype)initWithname:(NSString *)aName
                       total:(double)aTotal
                  splitCount:(NSInteger)aSplitCount
               tipPercentage:(double)aTipPercentage;

@end

NS_ASSUME_NONNULL_END
