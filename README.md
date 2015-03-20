# MZClockView

[![CI Status](http://img.shields.io/travis/devminz/MZClockView.svg?style=flat)](https://travis-ci.org/devminz/MZClockView)
[![Version](https://img.shields.io/cocoapods/v/MZClockView.svg?style=flat)](http://cocoadocs.org/docsets/MZClockView)
[![License](https://img.shields.io/cocoapods/l/MZClockView.svg?style=flat)](http://cocoadocs.org/docsets/MZClockView)
[![Platform](https://img.shields.io/cocoapods/p/MZClockView.svg?style=flat)](http://cocoadocs.org/docsets/MZClockView)

![SampleScreenshot](https://31.media.tumblr.com/6cb5a76df81071c788474c69ac8addf3/tumblr_inline_nhvokwyQXF1skxvgn.jpg)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

>```objective-c
>ClockView *clockView = [[ClockView alloc] initWithFrame:(CGRect)
>                                                  color:(UIColor *)
>                                                  hours:(NSInteger)
>                                                minutes:(NSInteger);
>[view addSubview:clockView];
>```

## How To Animate (Example)

# Start Ticking

>```objective-c
> [clockView playTickingWithTimeInterval:(NSTimeInterval)];
>```

# Stop Ticking

>```objective-c
> [clockView stopTicking];
>```

## Installation

MZClockView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "MZClockView"

## Author

devminz, devminz@naver.com

# Acknowledgement

ClockView for Android
http://github.com/devholic/ClockView/

## License

MZClockView is available under the MIT license. See the LICENSE file for more info.

