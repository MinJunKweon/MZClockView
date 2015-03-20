//
//  MZClockView.h
//  Kweon Min Jun
//
//  Created by Kweon Min Jun on 2015. 1. 9..
//  Copyright (c) 2015년 Kweon Min Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Colorful Clock View
 *
 *  @param  hours       Hour time to display
 *  @param  minutes     Minute time to display
 *  @param  handWidth   Clock hand width
 *  @param  borderWidth Clock border width
 *  @param  themeColor  Clock color
 */

@interface MZClockView : UIView

/**
 *  Hour time to display
 *
 *  @warning This is NSInteger type
 */

@property (nonatomic) NSInteger hours;

/**
 *  Minute time to display
 *
 *  @warning This is NSInteger type
 */

@property (nonatomic) NSInteger minutes;

/**
 *  Clock hand width
 *
 *  @warning This is CGFloat type
 */

@property (nonatomic) CGFloat handWidth;

/**
 *  Clock border width
 *
 *  @warning This is CGFloat type
 */

@property (nonatomic) CGFloat borderWidth;

/**
 *  Clock color
 */

@property (nonatomic, strong) UIColor *themeColor;

/**
 *  initializing with frame, color, hours & minutes
 *
 *  @param  frame   Position to display in superview
 *  @param  color   Clock theme color
 *  @param  hours   Hour time to display
 *  @param  minutes Minute time to display
 */

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
              hours:(NSInteger)hours
            minutes:(NSInteger)miniutes;

/**
 *  initializing with frame, color, hours, minutes, handWidth & borderWidth
 *
 *  @param  frame   Position to display in superview
 *  @param  color   Clock theme color
 *  @param  hours   Hour time to display
 *  @param  minutes Minute time to display
 *  @param  handWidth   Clock hand width
 *  @param  borderWidth Clock border width
 */

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
              hours:(NSInteger)hours
            minutes:(NSInteger)miniutes
          handWidth:(CGFloat)handWidth
        borderWidth:(CGFloat)borderWidth;

/**
 *  Play ticking MZClock
 *
 *  @param timeInterval ticking interval
 */

- (void)playTickingWithTimeInterval:(NSTimeInterval)timeInterval;

/**
 *  Stop ticking MZClock
 */

- (void)stopTicking;

@end
