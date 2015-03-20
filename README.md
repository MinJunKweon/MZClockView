# MZClockView
![SampleScreenshot](https://31.media.tumblr.com/6cb5a76df81071c788474c69ac8addf3/tumblr_inline_nhvokwyQXF1skxvgn.jpg)

## How To Use
'''
$ pod 'MZClockView', '~> 1.0.0'
'''

## Usage
'''objective-c
ClockView *clockView = [[ClockView alloc] initWithFrame:(CGRect)
                                                  color:(UIColor *)
                                                  hours:(NSInteger)
                                                minutes:(NSInteger);
[view addSubview:clockView];
'''

## How To Animate (Example)
'''objectiv-c
[clockView playTickingWithTimeInterval:(NSTimeInterval)];
'''

# Acknowledgement

ClockView for Android
http://github.com/devholic/ClockView/
