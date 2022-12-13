//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func playSound(key:String){
        do {
            let pianoSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: key, ofType: "wav")!)
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound as URL)
                    audioPlayer.play()
               } catch {
                  // couldn't load file :(
               }
    }
    @IBAction func onPressCButton(_ sender: UIButton) {
        func setOpacityBack(){
            sender.layer.opacity=1
        }
        print(sender.titleLabel?.text)
        sender.layer.opacity=0.5;
        playSound(key:(sender.titleLabel?.text)!)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute:setOpacityBack)
            
    }
    
    

}

