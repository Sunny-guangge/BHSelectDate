//
//  BHSelectDate.h
//  SelectDate
//
//  Created by 王帅广 on 16/6/22.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHSelectDateDelegate <NSObject>

- (void)selectDateWithYear:(NSString *)year month:(NSString *)month;

@end

@interface BHSelectDate : UIView

@property (nonatomic,weak) id<BHSelectDateDelegate> delegate;

@end


