//
//  ViewController.m
//  MZClockViewDemo
//
//  Created by Kweon Min Jun on 2015. 3. 21..
//  Copyright (c) 2015년 Minz. All rights reserved.
//

#import "ViewController.h"

#import <MZClockView/MZClockView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *colorArray = @[[self colorWithHexString:@"F44336"],
                            [self colorWithHexString:@"E91E63"],
                            [self colorWithHexString:@"9C27B0"],
                            [self colorWithHexString:@"673AB7"],
                            [self colorWithHexString:@"3F51B5"],
                            [self colorWithHexString:@"2196F3"],
                            [self colorWithHexString:@"03A9F4"],
                            [self colorWithHexString:@"00BCD4"],
                            [self colorWithHexString:@"009688"],
                            [self colorWithHexString:@"4CAF50"],
                            [self colorWithHexString:@"8BC34A"],
                            [self colorWithHexString:@"CDDC39"],
                            [self colorWithHexString:@"FFEB3B"],
                            [self colorWithHexString:@"FFC107"],
                            [self colorWithHexString:@"FF9800"]];
    
    NSArray *hoursArray = @[@0, @1, @1,
                            @2, @2, @3,
                            @3, @4, @5,
                            @6, @7, @8,
                            @9, @10, @11];
    
    NSArray *minutesArray = @[@0, @0, @10,
                              @0, @20, @0,
                              @30, @0, @0,
                              @0, @0, @30,
                              @0, @0, @30];
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            MZClockView *clockView = [[MZClockView alloc] initWithFrame:CGRectMake(39+(j*80)+j, 62+(i*80)+i, 80, 80)
                                                                  color:colorArray[(3*i)+j]
                                                                  hours:[hoursArray[(3*i)+j] integerValue]
                                                                minutes:[minutesArray[(3*i)+j] integerValue]];
            [clockView playTickingWithTimeInterval:1];
            [self.view addSubview:clockView];
        }
    }
}

- (UIColor *)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor grayColor];
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString length] != 6) return  [UIColor grayColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
