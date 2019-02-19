//
//  ViewController.swift
//  SimpleAudioRecorder
//
//  Created by Iyin Raphael on 2/19/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PlayerDelagate {
    
    private let player = Player()
    private let recorder = Recorder()
    
    private lazy var timeFormatter: DateComponentsFormatter = {
        let f = DateComponentsFormatter()
        f.unitsStyle = .positional
        f.zeroFormattingBehavior = .pad
        f.allowedUnits = [.minute, .second]
        return f
    }()
    
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        player.delegate = self
    }

    @IBAction func tappedPLayButton(_ sender: Any) {
        player.playPause()
    }
    
    func playerDidChangeState(_ player: Player) {
        updateViews()
    }
    
    func updateViews(){
        let isPlaying = player.isPlaying
        playButton.setTitle(isPlaying ? "Pause" : "Play", for: .normal)
        timeLabel.text = timeFormatter.string(from: player.elaspedTime)
        timeRemaining.text = timeFormatter.string(from: player.timeRemaining)
    
    }
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timeRemaining: UILabel!
    
    @IBAction func tappedRecordButton(_ sender: Any) {
    }
    
}

