//
//  ViewController.swift
//  tic tac toe
//
//  Created by Jesús Maldonado on 9/27/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import UIKit

extension UIButton {
  
    private struct AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
        static var Marked = "nsh_Marked"
        static var Ypos = "Ypos"
        static var Xpos = "Xpos"
        static var PlayerStatus = "PlayerStatus"
    }
    
    var marked: NSNumber? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.Marked) as? NSNumber
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.Marked,
                    newValue as NSNumber?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    var xpos: NSNumber? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.Xpos) as? NSNumber
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.Xpos,
                    newValue as NSNumber?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    var ypos: NSNumber? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.Ypos) as? NSNumber
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.Ypos,
                    newValue as NSNumber?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    var playerStatus: NSString? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.PlayerStatus) as? NSString
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.PlayerStatus,
                    newValue as NSString?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}

class ViewController: UIViewController {
    private var gameArray = [["", "", ""],["", "", ""],["", "", ""]]
    var color: String!
    var shape: String!
    
    func animateButton(button: UIButton) {
        let imageView = UIImageView(image: UIImage(named: "\(color)-\(shape).png")!)
        button.alpha = 0
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            button.alpha = 1
        })
        button.setBackgroundImage(imageView.image, forState: UIControlState.Normal)
    }
    
    func markStatus(button: UIButton) {
        let xpos = button.valueForKeyPath("xpos")! as! Int
        let ypos = button.valueForKeyPath("ypos")! as! Int
        gameArray[xpos][ypos] = shape!
        button.setValue(1, forKeyPath: "marked")
        checkWin()
    }
    func invertMatrix(gameArray: Array<Array<String>>) -> Array<Array<String>> {
        var invertedMatrix = Array<Array<String>>()
        for (i, _) in gameArray.enumerate() {
            invertedMatrix.append(["", "", ""])
            for (j, _) in gameArray[i].enumerate() {
                invertedMatrix[i][j] = gameArray[j][i]
            }
           
        }
        return invertedMatrix
    }
    
    func checkWin() {
        for row in gameArray {
            if checkRow(row) {
                animateWin()
                return
            }
        }
        let invertedMatrix = invertMatrix(gameArray)
        for row in invertedMatrix {
            if checkRow(row) {
                animateWin()
                return
            }
        }
        let diagonals = [ [[0,0],[1,1],[2,2]], [[2,0],[1,1],[0,2]] ]
        for diagonal in diagonals {
            var diagonalRow = [String]()
            for position in diagonal {
                diagonalRow.append(gameArray[position[0]][position[1]])
            }
            if checkRow(diagonalRow) {
                animateWin()
                return
            }
        }
        if gameDone() {
            animateDraw()
        } else {
            self.shape = self.shape == "cross" ? "nought" : "cross"
        }
    }
    
    func gameDone() -> Bool {
        for row in self.gameArray {
            for mark in row {
                if mark == "" {
                    return false
                }
            }
        }
        return true
    }
    
    func animateDraw() {
        showModalController("Draw!")
        print("draw")
    }
    
    func animateWin() {
        showModalController("\(shape.capitalizedString) won!")
        print("win")
    }
    
    func checkRow(row: [String]) -> Bool {
        for mark in row {
            if mark != shape {
                return false
            }
        }
        return true
    }
    
    @IBAction func buttonClicked(sender: UIButton) {
        let marked = sender.valueForKeyPath("marked")! as! Bool
        if !marked {
            animateButton(sender)
            markStatus(sender)
        } else {
            return
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private
    
    func showModalController(message: String!) {
        let modalVC = storyboard!.instantiateViewControllerWithIdentifier("ModalViewController") as! ModalViewController
        modalVC.message = message!

        presentViewController(modalVC, animated: true) { () -> Void in
            
        }
    }

}

