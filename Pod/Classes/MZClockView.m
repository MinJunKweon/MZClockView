//
//  MZClockView.m
//  Kweon Min Jun
//
//  Created by Kweon Min Jun on 2015. 1. 9..
//  Copyright (c) 2015년 Kweon Min Jun. All rights reserved.
//

#import "MZClockView.h"

#define LINE_WIDTH self.frame.size.width/10

@interface MZClockView ()

@property (nonatomic, strong) NSTimer *tickingTimer;

@end

@implementation MZClockView

#pragma mark - Initializing

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.themeColor = [UIColor blackColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
              hours:(NSInteger)hours
            minutes:(NSInteger)miniutes
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.themeColor = color;
        self.hours = hours;
        self.minutes = miniutes;
        self.borderWidth = 0;
        self.handWidth = 0;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
              hours:(NSInteger)hours
            minutes:(NSInteger)miniutes
          handWidth:(CGFloat)handWidth
        borderWidth:(CGFloat)borderWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.themeColor = color;
        self.hours = hours;
        self.minutes = miniutes;
        self.borderWidth = borderWidth;
        self.handWidth = handWidth;
    }
    return self;
}

#pragma mark - Draw

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    if (frame.size.width > frame.size.height)
        frame.size.height = frame.size.width;
    else
        frame.size.width = frame.size.height;
    self.frame = frame;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat borderWidth;
    CGFloat handWidth;
    
    if (_borderWidth == 0) {
        borderWidth = LINE_WIDTH;
    } else {
        borderWidth = _borderWidth;
    }
    
    if (_handWidth == 0) {
        handWidth = LINE_WIDTH;
    } else {
        handWidth = _handWidth;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, rect);
    CGContextAddEllipseInRect(context,
                              CGRectMake(rect.origin.x + (rect.size.width/10),
                                         rect.origin.y + (rect.size.height/10),
                                         rect.size.width - (rect.size.width/5),
                                         rect.size.height - (rect.size.height/5)));
    CGContextSetFillColor(context, CGColorGetComponents(self.themeColor.CGColor));
    CGContextEOFillPath(context);
    
    //hour line
    CGContextSetStrokeColorWithColor(context, self.themeColor.CGColor);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextAddLineToPoint(context, [self getHoursX], [self getHoursY]);
    CGContextStrokePath(context);
    
    //minute line
    CGContextSetStrokeColorWithColor(context, self.themeColor.CGColor);
    CGContextSetLineWidth(context, LINE_WIDTH);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextAddLineToPoint(context, [self getMinutesX], [self getMinutesY]);
    CGContextStrokePath(context);
}

- (void)playTickingWithTimeInterval:(NSTimeInterval)timeInterval
{
    _tickingTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)stopTicking
{
    [_tickingTimer invalidate];
}

- (void)tick
{
    self.minutes++;
    [self setNeedsDisplay];
}

#pragma mark - Setter

- (void)setHours:(NSInteger)hours
{
    if (hours > 11) _hours = hours - 12;
    else _hours = hours;
    [self setNeedsDisplay];
}

- (void)setMinutes:(NSInteger)minutes
{
    if (minutes > 59){
        _minutes = minutes - 60;
        _hours++;
    }
    else _minutes = minutes;
    [self setNeedsDisplay];
}

#pragma mark - Getter

- (CGFloat)getMinutesX
{
    CGFloat length = (self.bounds.size.width - (self.bounds.size.width/10))/2;
    CGFloat angle = [self convertToRadian:self.minutes * 6.0f];
    return self.bounds.size.width/2 + (sin(angle)*length*0.6f);
}

- (CGFloat)getMinutesY
{
    CGFloat length = (self.bounds.size.height - (self.bounds.size.height/10))/2;
    CGFloat angle = [self convertToRadian:(self.minutes * 6.0f) + 180];
    return self.bounds.size.height/2 + (cos(angle)*length*0.6f);
}

- (CGFloat)getHoursX
{
    CGFloat length = (self.bounds.size.width - (self.bounds.size.width/10))/2;
    CGFloat angle = [self convertToRadian:(self.hours * 30.0f) + (self.minutes * 0.5f)];
    return self.bounds.size.width/2 + (sin(angle)*length*0.4f);
}

- (CGFloat)getHoursY
{
    CGFloat length = (self.bounds.size.height - (self.bounds.size.height/10))/2;
    CGFloat angle = [self convertToRadian:(self.hours * 30.0f) + (self.minutes * 0.5f) + 180];
    return self.bounds.size.width/2 + (cos(angle)*length*0.4f);
}

#pragma mark - Convert Method

- (CGFloat)convertToRadian:(CGFloat)angle
{
    return angle / 180.0f * M_PI;
}

@end