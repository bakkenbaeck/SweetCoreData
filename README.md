# SweetCoreData

[![Version](https://img.shields.io/cocoapods/v/SweetCoreData.svg?style=flat)](https://cocoapods.org/pods/SweetCoreData)
[![License](https://img.shields.io/cocoapods/l/SweetCoreData.svg?style=flat)](https://cocoapods.org/pods/SweetCoreData)
[![Platform](https://img.shields.io/cocoapods/p/SweetCoreData.svg?style=flat)](https://cocoapods.org/pods/SweetCoreData)

## NSManagedObjectContext

### Drop entity

```swift
let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
context.dropEntity("User")
```

### Count entity

```swift
let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
let count = context.countEntity("User")
```

### Fetch entity (with generics)

```swift
let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
let users: [User] = context.fetchEntity("User")
```

## Installation

**SweetCoreData** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SweetCoreData'
```

**SweetCoreData** is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "bakkenbaeck/SweetCoreData"
```

## License

**SweetCoreData** is available under the MIT license. See the LICENSE file for more info.

## Author

Bakken & Bæck, [@bakkenbaeck](https://twitter.com/bakkenbaeck)
