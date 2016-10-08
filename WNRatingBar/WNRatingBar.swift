//
//  WNRatingBar.swift
//  WNRatingBar
//
//  Created by nino on 2017/7/4.
//  Copyright © 2017年 nino. All rights reserved.
//

import UIKit

protocol RatingBarDelegate:class {
    func ratingChanged(_ ratingBar:WNRatingBar,newRating:Float)
}
class WNRatingBar: UIView {
    weak var delegate:RatingBarDelegate?
    
    var starRating:Float?
    var lastRating:Float?
    
    var starWidth:CGFloat?
    var starHeight:CGFloat?
    
    var unSelectedImage:UIImage?
    var halfSelectedImage:UIImage?
    var fullSelectedImage:UIImage?
    
    var s1:UIImageView?
    var s2:UIImageView?
    var s3:UIImageView?
    var s4:UIImageView?
    var s5:UIImageView?
    //是否是指示器 默认 true，表示用来显示，不用来打分
    var isIndicator:Bool = true
    /**设置星星显示状态
     deselectedName   满星图片名
     halfSelectedName 半星图片名
     fullSelectedName 空星图片名
     starSideLength   星星边长
     */
    func setSeletedState(_ deselectedName:String?,halfSelectedName:String?,fullSelectedName:String?,starSideLength:CGFloat, delegate:RatingBarDelegate){
        self.delegate = delegate
        unSelectedImage = UIImage(named: deselectedName!)
        fullSelectedImage = UIImage(named: fullSelectedName!)
        halfSelectedImage = halfSelectedName == nil ? fullSelectedImage:UIImage(named: halfSelectedName!)
        
        
        starWidth = 0
        starHeight = 0
        if (starHeight! < starSideLength) {
            starHeight = starSideLength
        }
        if (starWidth! < starSideLength) {
            starWidth = starSideLength
        }
        
        
        //控件宽度适配
        var frame = self.frame
        var viewWidth:CGFloat = starWidth! * 5
        
        if (frame.size.width) > viewWidth {
            viewWidth = frame.size.width
        }
        frame.size.width = viewWidth
        self.frame = frame
        
        starRating = 0
        lastRating = 0
        
        s1 = UIImageView(image: unSelectedImage)
        s2 = UIImageView(image: unSelectedImage)
        s3 = UIImageView(image: unSelectedImage)
        s4 = UIImageView(image: unSelectedImage)
        s5 = UIImageView(image: unSelectedImage)
        
        //星星间距
        let space:CGFloat = (viewWidth - starWidth!*5)/6
        var starX = space
        let starY = (frame.height - starHeight!)/2
        s1?.frame = CGRect(x: starX, y: starY, width: starWidth!, height: starHeight!)
        starX = starX + starWidth! + space
        s2?.frame = CGRect(x: starX, y: starY, width: starWidth!, height: starHeight!)
        starX = starX + starWidth! + space
        s3?.frame = CGRect(x: starX, y: starY, width: starWidth!, height: starHeight!)
        starX = starX + starWidth! + space
        s4?.frame = CGRect(x: starX, y: starY, width: starWidth!, height: starHeight!)
        starX = starX + starWidth! + space
        s5?.frame = CGRect(x: starX, y: starY, width: starWidth!, height: starHeight!)
        starX = starX + starWidth! + space
        
        s1?.isUserInteractionEnabled = false
        s2?.isUserInteractionEnabled = false
        s3?.isUserInteractionEnabled = false
        s4?.isUserInteractionEnabled = false
        s5?.isUserInteractionEnabled = false
        
        self.addSubview(s1!)
        self.addSubview(s2!)
        self.addSubview(s3!)
        self.addSubview(s4!)
        self.addSubview(s5!)
    }
    //设置评分值
    func displayRating(_ rating:Float){
        s1?.image = unSelectedImage
        s2?.image = unSelectedImage
        s3?.image = unSelectedImage
        s4?.image = unSelectedImage
        s5?.image = unSelectedImage
        
        if (rating >= 1) {
            s1?.image = halfSelectedImage
        }
        if (rating >= 2) {
            s1?.image = fullSelectedImage
        }
        if (rating >= 3) {
            s2?.image = halfSelectedImage
        }
        if (rating >= 4) {
            s2?.image = fullSelectedImage
        }
        if (rating >= 5) {
            s3?.image = halfSelectedImage
        }
        if (rating >= 6) {
            s3?.image = fullSelectedImage
        }
        if (rating >= 7) {
            s4?.image = halfSelectedImage
        }
        if (rating >= 8) {
            s4?.image = fullSelectedImage
        }
        if (rating >= 9) {
            s5?.image = halfSelectedImage
        }
        if (rating >= 10) {
            s5?.image = fullSelectedImage
        }
        
        starRating = rating
        lastRating = rating
        delegate?.ratingChanged(self, newRating: rating)
        
    }
    
    func rating() -> Float{
        return starRating!
    }
    //手势
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.touchesRating(touches as NSSet)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.touchesRating(touches as NSSet)
    }
    //触发
    func touchesRating(_ touches:NSSet){
        if(self.isIndicator == true){
            return
        }
        
        let point:CGPoint = (touches.anyObject()! as AnyObject).location(in: self)
        let space:CGFloat = (self.frame.size.width - starWidth!*5)/6
        //这里为10分制 可根据逻辑改为五分制
        var newRating:Float = 0
        if (point.x >= 0 && point.x <= self.frame.size.width) {
            
            if (point.x <= space+starWidth!*0.5) {
                newRating = 1;
            }else if (point.x < space*2+starWidth!){
                newRating = 2;
            }else if (point.x < space*2+starWidth!*1.5){
                newRating = 3;
            }else if (point.x <= 3*space+2*starWidth!){
                newRating = 4;
            }else if (point.x <= 3*space+2.5*starWidth!){
                newRating = 5;
            }else if (point.x <= 4*space+3*starWidth!){
                newRating = 6;
            }else if (point.x <= 4*space+3.5*starWidth!){
                newRating = 7;
            }else if (point.x <= 5*space+4*starWidth!){
                newRating = 8;
            }else if (point.x <= 5*space+4.5*starWidth!){
                newRating = 9;
            }else {
                newRating = 10;
            }
        }
        
        if (newRating != lastRating){
            self.displayRating(newRating)
        }
    }
    
}
