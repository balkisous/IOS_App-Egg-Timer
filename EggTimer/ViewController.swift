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
    
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let softTime = 5;
    let mediumTime = 8;
    let hardTime = 12;
    let eggTime = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var secondsPassed = 0;
    var totalTime = 0;
    var timer =  Timer()

    @IBOutlet weak var TitleUp: UILabel!
    
    @IBOutlet weak var ProgressTimeBar: UIProgressView!

    @IBAction func Egg(_ sender: UIButton) {
        print("egg button haha and name is \(sender.currentTitle!)")

        timer.invalidate();
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]! //* 60;
        timer = Timer.scheduledTimer(timeInterval: 1.0, // Time interval in seconds
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    @objc func updateTimer()
    {
        if (secondsPassed < totalTime) {
            print("\(secondsPassed) seconds has passed")
            secondsPassed += 1;
            ProgressTimeBar.progress = Float(secondsPassed) / Float(totalTime)

        } else {
            print("time has finished, enjoy your egg !")
            timer.invalidate();
            TitleUp.text = "Time's up !";
            playAlarm();
        }
    }
    
    func playAlarm(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        /*
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3"){
            do {
                player = try! AVAudioPlayer(contentsOf: url)
                player.play()
            }
            catch {
                print("Play sound error: \(error)")
            }
        } else {
            print("Sound file doesn't found")
        }*/
    }
    
}
    
