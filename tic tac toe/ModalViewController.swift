//
//  ModalViewController.swift
//  tic tac toe
//
//  Created by Jesús Maldonado on 10/3/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  tic tac toe
//
//  Created by Jesús Maldonado on 9/27/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    var message: String!
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        messageLabel.text = message
    }
    override func viewDidLoad() {
    }
    @IBAction func playAgainButtonClicked(sender: AnyObject) {
        let secondVC = storyboard!.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        presentViewController(secondVC, animated: true) { () -> Void in
        }
    }
    
}