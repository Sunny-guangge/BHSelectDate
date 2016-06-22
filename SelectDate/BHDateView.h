//
//  BHDateView.h
//  SelectDate
//
//  Created by 王帅广 on 16/6/22.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHDateView : UIView

- (instancetype)initWithFrame:(CGRect)frame numTitle:(NSString *)num select:(BOOL)sel canEdit:(BOOL)canEdit;

@property (nonatomic,copy) NSString *num;

@property (nonatomic,assign) BOOL select;

@property (nonatomic,assign) BOOL canEdit;

- (void)addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
