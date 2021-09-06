//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Connor Goodman on 8/29/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = 0
    var  messageNumber = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "Fabulous? That's You!"]
        messageLabel.text = messages[messageNumber]
        messageNumber += 1
        
        if messageNumber == messages.count{
            messageNumber = 0
        }
        
        
        let imageName = "image\(imageNumber)"
        imageView.image = UIImage(named: imageName)
        imageNumber = imageNumber + 1
        if imageNumber == 10 {
            imageNumber = 0
        }
        

    }
    
}

