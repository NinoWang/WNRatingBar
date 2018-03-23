# WNRatingBar
五星评分显示器，可单纯展示评分，也可以用来打分，简单易用。

This is a five-star rating display, it can used to show rating and to score for something.
## Feature
WNRatingBar can used to show rating and to score for something,Like the following example.<br><br>

![Alt text](https://github.com/NinoWang/WNRatingBar/raw/master/imgs/2.gif)

## Installation

### Use cocoapods
Write these code to podfile, then run `pod install`
```
platform :ios, '8.0'
use_frameworks!

target “PodDemo” do
    pod ‘WNRatingBar’
end
```

### Manual import
Import this class `WNRatingBar.swift` and star-imgs.

## How to use WNRatingBar
### Show rating
```swift
ratingBar1 = WNRatingBar()
ratingBar1.frame = CGRect(x: explanationLab1.frame.origin.x, y: explanationLab1.frame.maxY + 10, width: 100, height: 40)
ratingBar1.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 24, delegate: self)
ratingBar1.displayRating(currentValue)
self.view.addSubview(ratingBar1)
```

### Used to score
Follow the `RatingBarDelegate` protocol at first.
```swift
ratingBar2 = WNRatingBar()
ratingBar2.frame = CGRect(x: explanationLab2.frame.origin.x, y: explanationLab2.frame.maxY + 10, width: 100, height: 40)
ratingBar2.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 24, delegate: self)
ratingBar2.displayRating(0)
ratingBar2.isIndicator = false
self.view.addSubview(ratingBar2)
```

```swift
//MARK:RatingBarDelegate
func ratingChanged(_ ratingBar: WNRatingBar, newRating: Float) {
if(ratingBar.tag == 2){
ratingValue = newRating
ratingLabel!.text = "\(ratingValue)"
}
}
```

## Explain
displayRating： Used to set the initial value of the score.<br><br>
isIndicator：Is it an indicator， default is true，It is used to display and not used for scoring.
