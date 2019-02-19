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
    }
}

