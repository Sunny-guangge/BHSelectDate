//
//  BHSelectDate.m
//  SelectDate
//
//  Created by 王帅广 on 16/6/22.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "BHSelectDate.h"
#import "BHDateView.h"

@interface BHSelectDate ()

@property (nonatomic,strong) UIView *titleView;
@property (nonatomic,strong) UILabel *centerLabel;
@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *rightLabel;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;


@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *dateBackView;

@end

static NSInteger const dateViewHeight = 60;

@implementation BHSelectDate
{
    NSInteger currentYear;
    NSInteger jinNian;
    NSInteger totalMonth;
    NSInteger currentMonth;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy"];
        NSString *strDate = [formatter stringFromDate:date];
        currentYear = [strDate integerValue];
        jinNian = [strDate integerValue];
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        [formatter1 setDateFormat:@"MM"];
        NSString *strDate1 = [formatter1 stringFromDate:date];
        totalMonth = [strDate1 integerValue];
        currentMonth = [strDate1 integerValue];
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.titleView];
        [self.titleView addSubview:self.centerLabel];
//        [self.titleView addSubview:self.leftImageView];
        [self.titleView addSubview:self.leftLabel];
//        [self.titleView addSubview:self.rightImageView];
        [self.titleView addSubview:self.rightLabel];
        [self.titleView addSubview:self.leftButton];
        [self.titleView addSubview:self.rightButton];
        
        [self addSubview:self.dateBackView];
        
        [self addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleView.frame = CGRectMake(0, 0, self.frame.size.width, 40);
    _centerLabel.frame = CGRectMake(self.frame.size.width / 2 - 40, 0, 80, 40);
    _leftImageView.frame = CGRectMake(10, 14, 7, 12);
    _rightImageView.frame = CGRectMake(self.frame.size.width - 17, 14, 7, 12);
    _leftLabel.frame = CGRectMake(CGRectGetMaxX(_leftImageView.frame) + 5, 0, 60, 40);
    _rightLabel.frame = CGRectMake(self.frame.size.width - 77, 0, 60, 40);
    _leftButton.frame = CGRectMake(0, 0, 77, 40);
    _rightButton.frame = CGRectMake(self.frame.size.width - 77, 0, 77, 40);
    
    _lineView.frame = CGRectMake(0, 39.5, self.frame.size.width, 0.5);
    _dateBackView.frame = CGRectMake(0, CGRectGetMaxY(_titleView.frame), self.frame.size.width, 120);
}

- (UIView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[UIView alloc] init];
        _titleView.backgroundColor = [UIColor clearColor];
        
        [_titleView addSubview:self.centerLabel];
    }
    return _titleView;
}

- (UILabel *)centerLabel
{
    if (_centerLabel == nil) {
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        _centerLabel.textColor = [UIColor blueColor];
        _centerLabel.font = [UIFont systemFontOfSize:14];
        _centerLabel.text = [NSString stringWithFormat:@"%ld年",(long)currentYear];
    }
    return _centerLabel;
}
- (UILabel *)leftLabel
{
    if (_leftLabel == nil) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = [UIFont systemFontOfSize:14];
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.text = [NSString stringWithFormat:@"< %ld",currentYear - 1];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = [UIFont systemFontOfSize:14];
        _rightLabel.textColor = [UIColor grayColor];
        _rightLabel.text = [NSString stringWithFormat:@"%ld >",currentYear + 1];
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

- (UIImageView *)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.image = [UIImage imageNamed:@"leftjiantou"];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.image = [UIImage imageNamed:@"leftjiantou"];
    }
    return _rightImageView;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(didClickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addTarget:self action:@selector(didClickRightButton) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.enabled = NO;
    }
    return _rightButton;
}


- (UIView *)dateBackView
{
    if (_dateBackView == nil) {
        _dateBackView = [[UIView alloc] init];
        _dateBackView.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i=1; i<13; i++) {
            
            CGFloat w;
            if (i % 6 == 0) {
                w = self.frame.size.width / 6 * 5;
            }else
            {
                w = self.frame.size.width / 6 * (i % 6 - 1);
            }
            
            CGFloat h ;
            if ((i - 1) / 6 == 1 ) {
                h = dateViewHeight;
            }else
            {
                h = 0;
            }
            
            BHDateView *dateView = [[BHDateView alloc] initWithFrame:CGRectMake(w, h, self.frame.size.width / 6, dateViewHeight) numTitle:[NSString stringWithFormat:@"%ld",(long)i] select:NO canEdit:YES];
            dateView.tag = i + 10;
            [dateView addTarget:self action:@selector(didClickDateView:) forControlEvents:UIControlEventTouchUpInside];
            
            [_dateBackView addSubview:dateView];
            
            if (i > totalMonth) {
                dateView.canEdit = NO;
            }
            
        }
    }
    return _dateBackView;
}

- (UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

- (void)didClickLeftButton
{
    currentYear -= 1;
    
    _leftLabel.text = [NSString stringWithFormat:@"< %ld",currentYear - 1];
    _rightLabel.text = [NSString stringWithFormat:@"%ld >",currentYear + 1];
    _centerLabel.text = [NSString stringWithFormat:@"%ld年",currentYear];
    
    if (currentYear >= jinNian) {
        _rightButton.enabled = NO;
    }else
    {
        _rightButton.enabled = YES;
        _rightLabel.textColor = [UIColor blackColor];
    }
    totalMonth = 12;
    [self updateMonth];
    NSLog(@"left");
}

- (void)didClickRightButton
{
    currentYear += 1;
    
    _leftLabel.text = [NSString stringWithFormat:@"< %ld",currentYear - 1];
    _rightLabel.text = [NSString stringWithFormat:@"%ld >",currentYear + 1];
    _centerLabel.text = [NSString stringWithFormat:@"%ld年",currentYear];
    if (currentYear >= jinNian) {
        _rightButton.enabled = NO;
        _rightLabel.textColor = [UIColor grayColor];
        totalMonth = currentMonth;
    }else
    {
        _rightButton.enabled = YES;
        _rightLabel.textColor = [UIColor blackColor];
        totalMonth = 12;
    }
    [self updateMonth];
    NSLog(@"right");
}


- (void)updateMonth
{
    for (NSInteger i=11; i< 23; i++) {
        
        BHDateView *dateview = (BHDateView *)[self viewWithTag:i];
        
        if (i > totalMonth + 10) {
            dateview.canEdit = NO;
        }else
        {
            dateview.canEdit = YES;
        }
    }
}

- (void)didClickDateView:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    
    for (NSInteger i=11; i< 23; i++) {
        
        BHDateView *dateview = (BHDateView *)[self viewWithTag:i];
        
        if (i == sender.tag) {
            dateview.select = YES;
        }else
        {
            dateview.select = NO;
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(selectDateWithYear: month:)]) {
        [self.delegate selectDateWithYear:[NSString stringWithFormat:@"%ld",currentYear] month:[NSString stringWithFormat:@"%ld",sender.tag - 10]];
    }
    
}

@end
