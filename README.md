# Table of Contents

- [AAFloatingButton](#section-id-4)
- [Description](#section-id-10)
- [Demonstration](#section-id-16)
- [Requirements](#section-id-26)
- [Installation](#section-id-32)
- [CocoaPods](#section-id-37)
- [Carthage](#section-id-63)
- [Manual Installation](#section-id-82)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AAFloatingButton

[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AAFloatingButton.svg)](http://cocoadocs.org/docsets/AAFloatingButton) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AAFloatingButton.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AAFloatingButton) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AAFloatingButton.svg)]()


<div id='section-id-10'/>

##Description


AAFloatingButton is floating action button component of material design for iOS. It has ripple effect same as per the material design.


<div id='section-id-16'/>

##Demonstration



![](https://github.com/EngrAhsanAli/AAFloatingButton/blob/master/Screenshots/AAFloatingButton.png)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 8.0+
- Xcode 8.0+


<div id='section-id-32'/>

# Installation

`AAFloatingButton` can be installed using CocoaPods, Carthage, or manually.


<div id='section-id-37'/>

##CocoaPods

`AAFloatingButton` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AAFloatingButton', '~> 1.1'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-63'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AAFloatingButton" "master"
```

Then import the library in all files where you use it:
```swift
import AAFloatingButton
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AAFloatingButton` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-156'/>

#Contributions & License

`AAFloatingButton` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AAFloatingButton` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)

