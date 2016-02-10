# CharPageControl
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/CharPageControl.svg)](https://img.shields.io/cocoapods/v/CharPageControl.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-Apache 2.0-lightgrey.svg)](https://raw.githubusercontent.com/indevizible/CharPageControl/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/CharPageControl.svg?style=flat)](http://cocoadocs.org/docsets/CharPageControl)
[![Twitter](https://img.shields.io/badge/twitter-@indevizible-blue.svg?style=flat)](http://twitter.com/indevizible)

CharPageControl is a **GLYPH** style for pagination written in swift.

![Demo](/imgs/03.gif)

## Features
- [x] Custom font
- [x] Color transition
- [x] IBInspectable support

![inspecable](/imgs/01.png)

- [x] IBDesignable support

![inspecable](/imgs/02.png)

## Requirements
- Swift 2+
- iOS 8.0+

##  Installation
You can install this library in 2 ways

### Manually

Copy [CharPageControl.swift](CharPageControl/CharPageControl.swift) to your project.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CharPageControl into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'CharPageControl', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CharPageControl into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "indevizible/CharPageControl" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `CharPageControl.framework` into your Xcode project.

## Usage
- Import and declare CharPageControl:
```swift
import CharPageControl

class ViewController: UIViewController{
  @IBOutlet
  var pageControl: CharPageControl!
}
```

- Drag and drop UILabel from panel to storyboard
- Change UILabel class to **CharPageControl**
- Go to Attribute Inspector and set your pattern and other properties
- Embed label to your ViewController class
- And set page with CGFloat when scrollView did scroll

```swift
func scrollViewDidScroll(scrollView: UIScrollView) {
  let currentPage = (CGFloat(pageCount) * scrollView.contentOffset.x)/scrollView.contentSize.width
  pageControl.currentPage = currentPage
}
```

And more on CharPageControlExample.xcodeproj

## Credit

This project was Inspired by [Virakri Jinangkul](https://github.com/virakri)

## Author

Nattawut Singhchai, jadedragon17650@gmail.com

## License

CharPageControl is available under the Apache 2.0 license. See the [LICENSE file](LICENSE).

