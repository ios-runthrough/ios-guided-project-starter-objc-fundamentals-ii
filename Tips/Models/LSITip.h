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

@property (nonatomic) NSString *name;
@property (nonatomic) double total;
@property (nonatomic) NSInteger splitCount;
@property (nonatomic) double tipCount;

@end

NS_ASSUME_NONNULL_END
