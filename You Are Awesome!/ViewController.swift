//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Connor Goodman on 8/29/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    let totalNumberOfSounds = 5
    let totalNumberOfImages = 9
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch {
                print("ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object 😢")
            }
        }
        else{
            print("ERROR: Could not read data from file sound0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperBounds: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds-1)
        } while originalNumber == newNumber
        return newNumber
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "Fabulous? That's You!",
                        "When The Genius Bar Needs Help, They Call You!",
                        "You've Got The Design Skills of Jony Ives"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperBounds: messages.count)
        messageLabel.text = messages[messageNumber]
        
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperBounds: totalNumberOfImages)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperBounds: totalNumberOfSounds)
        if playSoundSwitch.isOn{
            playSound(name: "sound\(soundNumber)")
        }
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !playSoundSwitch.isOn && audioPlayer != nil{
            audioPlayer.stop()
        }
    }
    
    
}

