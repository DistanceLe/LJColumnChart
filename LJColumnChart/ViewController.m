//
//  ViewController.m
//  LJColumnChart
//
//  Created by LiJie on 2017/2/27.
//  Copyright © 2017年 LiJie. All rights reserved.
//

#import "ViewController.h"

#import "LJColumnChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
    
    LJColumnChartView* chartView = [[LJColumnChartView alloc]initWithFrame:CGRectMake(10, 100, IPHONE_WIDTH-20, 150)];
    chartView.backgroundColor = [UIColor orangeColor];
    
    chartView.XAxisTextsArray = @[@"02\n84", @"23", @"我的", @"我们", @"452", @"45"];
    chartView.valueArray = @[@(100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100)];
    chartView.columnColor = [UIColor greenColor];
    
    chartView.columnWidthsArray = @[@(23), @(45), @(47), @(20),@(62), @(30)];
    chartView.columnColorsArray = @[[UIColor redColor], [UIColor greenColor],[UIColor redColor], [UIColor greenColor],[UIColor redColor], [UIColor greenColor]];
    
    chartView.yAxisMax = 150;
//    chartView.columnSpace = 0;
    
    chartView.XUnit = @"30分钟";
    chartView.YUnit = @"步";
    
    [chartView showChart];
    [self.view addSubview:chartView];
    
    
    UIButton* againButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 100, 50)];
    againButton.backgroundColor = [UIColor greenColor];
    [againButton addTargetClickHandler:^(UIButton *but, id obj) {
        NSArray* titles = @[@"02\n84", @"23", @"我的", @"我们", @"452", @"45"];
        NSArray* datas = @[@(arc4random()%100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100), @(arc4random()%100)];
        [chartView addData:datas titleArray:titles widthArray:nil colorArray:nil animation:YES];
    }];
    [self.view addSubview:againButton];
    
}





@end
