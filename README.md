# WNRatingBar
五星评分显示器，可单纯展示评分，也可以用来打分，简单易用。

## 效果预览
![Alt text](https://github.com/NinoWang/WNRatingBar/raw/master/Screenshots/2.gif)

## 使用方法
首先导入 WNRatingBar这个类，导入星星的图片文件。
### 1.仅用来显示
```swift
ratingBar1 = WNRatingBar()
ratingBar1.frame = CGRect(x: explanationLab1.frame.origin.x, y: explanationLab1.frame.maxY + 10, width: 100, height: 40)
ratingBar1.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 24, delegate: self)
ratingBar1.displayRating(currentValue)
self.view.addSubview(ratingBar1)
```

### 2.用来打分
首先要遵循协议：RatingBarDelegate
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

## 说明
displayRating： 用来设置分值的初始值<br> 
isIndicator：是否是指示器 默认 true，表示用来显示，不用来打分。
