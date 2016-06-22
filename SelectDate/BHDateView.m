//
//  BHDateView.m
//  SelectDate
//
//  Created by 王帅广 on 16/6/22.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHDateView.h"

@interface BHDateView ()

@property (nonatomic,strong) UILabel *numLabel;

@property (nonatomic,strong) UILabel *englishLabel;

@property (nonatomic,strong) UIButton *button;

@end

static NSInteger const numLabelFont = 14;
static NSInteger const englishLabelFont = 12;

static NSString *const numLabelColor = @"#333333";
static NSString *const englishLabelColor = @"#666666";

static NSString *const selectLabelColor = @"#4286f5";

static NSString *const cannotEditColor = @"#999999";

@implementation BHDateView

- (instancetype)initWithFrame:(CGRect)frame numTitle:(NSString *)num select:(BOOL)sel canEdit:(BOOL)canEdit
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _num = num;
        _select = sel;
        _canEdit = canEdit;
        
        [self addSubview:self.numLabel];
        [self addSubview:self.englishLabel];
        [self addSubview:self.button];
    }
    return self;
}

#pragma mark - Setter
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _numLabel.frame = CGRectMake(0, self.bounds.size.height / 2 - 3 - 16, self.bounds.size.width, 16);
    _englishLabel.frame = CGRectMake(0, self.bounds.size.height / 2 + 3, self.bounds.size.width, 14);
    _button.frame = self.bounds;
}

- (void)setNum:(NSString *)num
{
    _num = num;
    
    _numLabel.text = [NSString stringWithFormat:@"%@月", num];
    if ([num isEqualToString:@"1"]) {
        _englishLabel.text = @"Jan";
    }
    if ([num isEqualToString:@"2"]) {
        _englishLabel.text = @"Feb";
    }
    if ([num isEqualToString:@"3"]) {
        _englishLabel.text = @"Mar";
    }
    if ([num isEqualToString:@"4"]) {
        _englishLabel.text = @"Apr";
    }
    if ([num isEqualToString:@"5"]) {
        _englishLabel.text = @"May";
    }
    if ([num isEqualToString:@"6"]) {
        _englishLabel.text = @"Jun";
    }
    if ([num isEqualToString:@"7"]) {
        _englishLabel.text = @"Jul";
    }
    if ([num isEqualToString:@"8"]) {
        _englishLabel.text = @"Aug";
    }
    if ([num isEqualToString:@"9"]) {
        _englishLabel.text = @"Sept";
    }
    if ([num isEqualToString:@"10"]) {
        _englishLabel.text = @"Oct";
    }
    if ([num isEqualToString:@"11"]) {
        _englishLabel.text = @"Nov";
    }
    if ([num isEqualToString:@"12"]) {
        _englishLabel.text = @"Dec";
    }
}

- (void)setSelect:(BOOL)select
{
    _select = select;
    
    if (_canEdit) {
        
        if (_select) {
            _numLabel.textColor = [UIColor blueColor];
            _englishLabel.textColor = [UIColor blueColor];
        }else
        {
            _numLabel.textColor = [UIColor blackColor];
            _englishLabel.textColor = [UIColor grayColor];
        }
        
    }else
    {
        _numLabel.textColor = [UIColor grayColor];
        _englishLabel.textColor = [UIColor grayColor];
    }
}

- (void)setTag:(NSInteger)tag
{
    [super setTag:tag];
    
    self.button.tag = tag;
}

- (void)setCanEdit:(BOOL)canEdit
{
    _canEdit = canEdit;
    
    _button.enabled = canEdit;
    
    if (canEdit) {
        
        if (_select) {
            _numLabel.textColor = [UIColor blueColor];
            _englishLabel.textColor = [UIColor blueColor];
        }else
        {
            _numLabel.textColor = [UIColor blackColor];
            _englishLabel.textColor = [UIColor grayColor];
        }
        
    }else
    {
        _numLabel.textColor = [UIColor grayColor];
        _englishLabel.textColor = [UIColor grayColor];
    }
}

#pragma mark - Getter
- (UILabel *)numLabel
{
    if (_numLabel == nil) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.font = [UIFont systemFontOfSize:numLabelFont];
        if (_select) {
            _numLabel.textColor = [UIColor blueColor];
            
        }else
        {
            _numLabel.textColor = [UIColor blackColor];
        }
        if (_canEdit) {
            
        }else
        {
            _numLabel.textColor = [UIColor grayColor];
        }
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.text = [NSString stringWithFormat:@"%@月", _num];
    }
    return _numLabel;
}

- (UILabel *)englishLabel
{
    if (_englishLabel == nil) {
        _englishLabel = [[UILabel alloc] init];
        _englishLabel.font = [UIFont systemFontOfSize:englishLabelFont];
        if (_select) {
            _englishLabel.textColor = [UIColor blueColor];
        }else
        {
            _englishLabel.textColor = [UIColor grayColor];
        }
        if (_canEdit) {
            
        }else
        {
            _englishLabel.textColor = [UIColor grayColor];
        }
        
        if ([_num isEqualToString:@"1"]) {
            _englishLabel.text = @"Jan";
        }
        if ([_num isEqualToString:@"2"]) {
            _englishLabel.text = @"Feb";
        }
        if ([_num isEqualToString:@"3"]) {
            _englishLabel.text = @"Mar";
        }
        if ([_num isEqualToString:@"4"]) {
            _englishLabel.text = @"Apr";
        }
        if ([_num isEqualToString:@"5"]) {
            _englishLabel.text = @"May";
        }
        if ([_num isEqualToString:@"6"]) {
            _englishLabel.text = @"Jun";
        }
        if ([_num isEqualToString:@"7"]) {
            _englishLabel.text = @"Jul";
        }
        if ([_num isEqualToString:@"8"]) {
            _englishLabel.text = @"Aug";
        }
        if ([_num isEqualToString:@"9"]) {
            _englishLabel.text = @"Sept";
        }
        if ([_num isEqualToString:@"10"]) {
            _englishLabel.text = @"Oct";
        }
        if ([_num isEqualToString:@"11"]) {
            _englishLabel.text = @"Nov";
        }
        if ([_num isEqualToString:@"12"]) {
            _englishLabel.text = @"Dec";
        }
        _englishLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _englishLabel;
}

- (UIButton *)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor clearColor];
        if (_canEdit) {
            _button.enabled = YES;
        }else
        {
            _button.enabled = NO;
        }
    }
    return _button;
}

- (void)addTarget:(nullable id)target action:(nonnull SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [self.button addTarget:target action:action forControlEvents:controlEvents];
}

@end
