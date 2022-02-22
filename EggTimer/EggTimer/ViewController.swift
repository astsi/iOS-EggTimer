//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //buttons
    //mainLabel
    let eggTimes = ["Soft" : 300, "Medium" : 480, "Hard" : 720]
    var timeRemaining : Float = 0.0
    var totalTime : Float = 0.0
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        
        mainLabel.text = sender.currentTitle!
        timeRemaining = Float(eggTimes[sender.currentTitle!]!)
        totalTime = timeRemaining
        eggProgress.progress = 1.0
        
        startEggTimer()
        
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    
    func startEggTimer(){
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.timeRemaining + 1 > 0 {
                    
                    self.eggProgress.progress = self.timeRemaining / self.totalTime
                    //print ("\(self.timeRemaining) seconds")
                    //print ("Total time: \(self.totalTime)")
                    self.timeRemaining -= 1
                } else {
                    self.mainLabel.text = "Done!"
                    self.playSound()
                    Timer.invalidate()
                }
            }
            
        }
    }
    
