//
//  ViewController.swift
//  WNRatingBar
//
//  Created by nino on 2017/7/4.
//  Copyright © 2017年 nino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RatingBarDelegate {
    //仅用来展示
    var ratingBar1: WNRatingBar!
    
    var currentValue:Float = 8
    //用来评分
    var ratingBar2: WNRatingBar!
    
    var ratingLabel:UILabel!
    
    var ratingValue:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let explanationLab1 = UILabel()
        explanationLab1.frame = CGRect(x:20, y:30, width:200, height:20)
        explanationLab1.text = "用来展示评分"
        self.view.addSubview(explanationLab1)
        
        ratingBar1 = WNRatingBar()
        ratingBar1.frame = CGRect(x: explanationLab1.frame.origin.x, y: explanationLab1.frame.maxY + 10, width: 100, height: 40)
        ratingBar1.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 24, delegate: self)
        ratingBar1.displayRating(currentValue)
        ratingBar1.tag = 1
        self.view.addSubview(ratingBar1)
        
        let valueLab = UILabel()
        valueLab.frame = CGRect(x:ratingBar1.frame.maxX + 5, y:ratingBar1.frame.origin.y, width:50, height:ratingBar1.frame.size.height)
        valueLab.text = "\(currentValue)"
        self.view.addSubview(valueLab)
        
        ///
        let explanationLab2 = UILabel()
        explanationLab2.frame = CGRect(x:20, y:ratingBar1.frame.maxY + 30, width:200, height:20)
        explanationLab2.text = "用来手动打分"
        self.view.addSubview(explanationLab2)
        
        ratingBar2 = WNRatingBar()
        ratingBar2.frame = CGRect(x: explanationLab2.frame.origin.x, y: explanationLab2.frame.maxY + 10, width: 100, height: 40)
        ratingBar2.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 24, delegate: self)
        ratingBar2.displayRating(0)
        ratingBar2.isIndicator = false
        self.view.addSubview(ratingBar2)
        
        ratingLabel = UILabel()
        ratingLabel!.frame = CGRect(x:ratingBar2.frame.maxX + 5, y:ratingBar2.frame.origin.y, width:100, height:ratingBar2.frame.size.height)
        ratingLabel!.text = "尚未评分"
        ratingBar2.tag = 2
        self.view.addSubview(ratingLabel!)
    }
    
    //MARK:RatingBarDelegate
    func ratingChanged(_ ratingBar: WNRatingBar, newRating: Float) {
        if(ratingBar.tag == 2){
            ratingValue = newRating
            ratingLabel!.text = "\(ratingValue)"
        }
    }
    
    
}

