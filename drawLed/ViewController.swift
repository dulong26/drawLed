//
//  ViewController.swift
//  drawLed
//
//  Created by Nguyen Quynh Chi on 5/7/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumOfBall: UITextField!
    @IBOutlet weak var btDraw: UIButton!
    
    let margin: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    @IBAction func actionDraw(_ sender: UIButton) {
        clean()
        if let numOfBall = Int(tfNumOfBall.text!) {
            drawGreenBall(num: numOfBall)
        }
    }
    
    func drawGreenBall(num: Int) {
        for column in 0..<num {
            for row in 0..<num {
        
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                let centerX = margin + columnDistance(numOfColumn: num)*CGFloat(column)
                let centerY = margin + CGFloat(70) + rowDistance(numOfRow: num)*CGFloat(row)
        
                ball.center = CGPoint(x: centerX, y: centerY)
                self.view.addSubview(ball)
            }
            
        }
    }
    
    func clean() {
        for subview in self.view.subviews {
            if (subview !== tfNumOfBall)&&(subview !== btDraw) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func columnDistance(numOfColumn: Int) -> CGFloat {
        var columnSpace: CGFloat
        
        if (numOfColumn != 1) {
            columnSpace = (view.bounds.size.width - 2*margin)/CGFloat(numOfColumn - 1)
        } else {
            columnSpace = 0
        }
        
        return columnSpace
    }
    
    func rowDistance(numOfRow: Int) -> CGFloat {
        var rowSpace: CGFloat
        
        if (numOfRow != 1) {
            rowSpace = (view.bounds.size.height - 2*margin - 70)/CGFloat(numOfRow - 1)
        } else {
            rowSpace = 0
        }
        
        return rowSpace
    }

}

