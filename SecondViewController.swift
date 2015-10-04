//
//  ViewController.swift
//  tic tac toe
//
//  Created by Jesús Maldonado on 9/27/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var state = "pickColor"
    var color: String?
    var shape: String?
    
    override func viewDidLoad() {

        UIView.animateWithDuration(1, animations: { () -> Void in
            self.instructionLabel.text = "Pick a color!"
        })
        cullButtonRadius()
        addBorderRadius()
        disableButton(playButton)
    }
    
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var playButton: UIButton!
    
    @IBAction func firstButtonClicked(sender: UIButton) {
        if state == "pickColor" {
            color = "black"
            proceedToPickShape()
            return
        }
        
        if state == "pickShape" {
            shape = "cross"
            proceedToReadyToPlay()
            return
        }
        
        if state == "readyToPlay" {
            changeLabelText("No really, press Play!")
        }
    }
    @IBAction func secondButtonClicked(sender: UIButton) {
        if state == "pickColor" {
            color = "white"
            proceedToPickShape()
            return

        }
        
        if state == "pickShape" {
            shape = "nought"
            proceedToReadyToPlay()
            return
        }
        
        if state == "readyToPlay" {
            changeLabelText("No really, press Play!")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPlay" {
            let viewController = segue.destinationViewController as! ViewController
            viewController.color = color
            viewController.shape = shape
        }
    }
    private
    
    func proceedToPickShape() {
        disableAndAnimateButtons()
        changeBackgroundImage(color)
        changeLabelText("Pick a shape!")
    }
    
    func proceedToReadyToPlay() {
        state = "readyToPlay"
        changeLabelText("Press Play")
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.playButton.alpha = 1
            self.playButton.enabled = true
        })
    }
    
    func changeBackgroundImage(color: String!) {
        firstButton.backgroundColor = UIColor.clearColor()
        secondButton.layer.borderWidth = 0
        self.firstButton.setBackgroundImage(UIImage(named: "\(color)-cross.png"), forState: UIControlState.Normal)
        self.secondButton.setBackgroundImage(UIImage(named: "\(color)-nought.png"), forState: UIControlState.Normal)
        
    }
    
    func changeLabelText(labelText: String!) {
        self.instructionLabel.alpha = 0
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.instructionLabel.alpha = 1
            self.instructionLabel.text = labelText!
        })
    }
    
    func disableAndAnimateButtons() {
        disableButton(firstButton)
        disableButton(secondButton)
        animateButtons()
        state = "pickShape"
    }
    func cullButtonRadius() {
        secondButton.layer.cornerRadius = 5
        playButton.layer.cornerRadius = 5
        firstButton.layer.cornerRadius = 5
    }
    func disableButton(button: UIButton) {
        button.enabled = false
        button.alpha = 0
    }
    
    func animateButtons() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.firstButton.alpha = 1
            self.firstButton.enabled = true
            self.secondButton.alpha = 1
            self.secondButton.enabled = true
        })
    }
    
    func addBorderRadius() {
        secondButton.layer.borderWidth = 0.2
        secondButton.layer.borderColor = UIColor.blackColor().CGColor
        playButton.layer.borderWidth = 0.2
        playButton.layer.borderColor = UIColor.blackColor().CGColor
        
    }
}

