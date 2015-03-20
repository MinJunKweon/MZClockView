#
# Be sure to run `pod lib lint MZClockView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MZClockView"
  s.version          = "1.0.0"
  s.summary          = "Colorful Clock View for iOS"
  s.description      = <<-DESC
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
                       DESC
  s.homepage         = "https://github.com/devminz/MZClockView"
  # s.screenshots     = "https://31.media.tumblr.com/6cb5a76df81071c788474c69ac8addf3/tumblr_inline_nhvokwyQXF1skxvgn.jpg"
  s.license          = 'MIT'
  s.author           = { "devminz" => "devminz@naver.com" }
  s.source           = { :git => "https://github.com/devminz/MZClockView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MZClockView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
