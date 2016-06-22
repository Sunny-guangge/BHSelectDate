//
//  ViewController.m
//  SelectDate
//
//  Created by 王帅广 on 16/6/22.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "BHSelectDate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BHSelectDate *date = [[BHSelectDate alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 160)];
    [self.view addSubview:date];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
