# TapRippleAnimationView
Make Ripple Effects when you tap UIView.

![Alt text](https://github.com/willy12262001/TapRippleAnimationView/blob/master/animate.gif)

## Installation

Just add the following line to your Podfile:

```js
pod 'TapRippleAnimationView'
```


## Usage

You can simply use it with storyboard or programming.

#### In class way:
```swift
let effectView = TapRippleAnimationView(frame: rect)
effectView.delegate = self
view.addSubview(effectView)
```
#### In storyboard way:
![Alt text](https://github.com/willy12262001/TapRippleAnimationView/blob/master/Screenshot.png)
```swift
@IBOutlet weak var tapView: TapRippleAnimationView!
tapView.delegate = self
```

then you can get tap action by **`TapRippleAnimationViewDelegate`**.
```swift
protocol TapRippleAnimationViewDelegate: class {
    func tapRippleAnimationViewAction(_ view: TapRippleAnimationView)
}
```
## License
TapRippleAnimationView is available under the MIT license. See the LICENSE file for more info.
