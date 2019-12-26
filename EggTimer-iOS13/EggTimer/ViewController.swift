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
    
//    var soft = 5
//    var medium = 7
//    var hard = 12
    var eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
   // var second = 60
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var alarm: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func press(_ sender: UIButton) {
        
        //progressBar.progress = 1.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        //let result = eggTime[hardness]!
        //print(result)
        totalTime = eggTime[hardness]!
        progressBar.progress = 0.0
        secondPassed = 0
        displayLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        if hardness == "Soft"{
//            print(soft)
//        }else if hardness == "Medium"{
//            print(medium)
//        }else {
//            print(hard)
//        }
//        switch hardness {
//        case "Soft":
//            print(soft)
//        case "Medium":
//            print(medium)
//        case "Hard":
//            print(hard)
//        default:
//            print("Error")
//        }
    }
    @objc func updateTimer(){
        if secondPassed < totalTime {
            //print("\(second) second.")
            //let percentageProgress = secondPassed / totalTime
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            //print(Float(secondPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            displayLabel.text = "Done!"
            
             let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

            alarm = try! AVAudioPlayer(contentsOf: url!)

            alarm.play()
        }
    }
    
}
