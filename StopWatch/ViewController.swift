//
//  ViewController.swift
//  StopWatch
//
//  Created by Nanthakumaran.
//  Copyright © 2019 Nanthakumaran. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter: Float = 0.0 {

        didSet {
            timeLabel.text = String(format: "%.1f", counter)
        }
    }

    var timer: Timer? = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {

        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counter = 0.0
    }
    
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true

        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
        
    }
    
   @objc func UpdateTimer() {
        counter = counter + 0.1
    }
    
    
}

