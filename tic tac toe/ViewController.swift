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
    private var userVariable = "cross"
    
    @IBAction func buttonClicked(sender: UIButton) {
        print(sender.valueForKeyPath("marked")!)
        let marked = sender.valueForKeyPath("marked")! as! Bool
        print(marked)
        sender.setBackgroundImage(UIImage(named: "black-\(userVariable).png"), forState: UIControlState.Normal)
        let xpos = sender.valueForKeyPath("xpos")! as! Int
        let ypos = sender.valueForKeyPath("ypos")! as! Int
        gameArray[xpos][ypos] = userVariable
        sender.setValue(1 as! NSNumber, forKeyPath: "marked")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

