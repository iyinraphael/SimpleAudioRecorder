 //
//  MyPlayer.swift
//  SimpleAudioRecorder
//
//  Created by Iyin Raphael on 2/19/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation
import AVFoundation
 
 protocol PlayerDelagate: AnyObject {
    func playerDidChangeState(_ player: Player)
 }

 class Player: NSObject, AVAudioPlayerDelegate {
    
    private var audioPlayer: AVAudioPlayer?
    weak var delegate: PlayerDelagate?
    private var timer: Timer?
    
    var elaspedTime: TimeInterval {
        return audioPlayer?.currentTime ?? 0
    }
    
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
    
    func playPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    func play(){
        if audioPlayer == nil {
            //make an audio player
            let sougURL = Bundle.main.url(forResource: "Bang", withExtension:"mp3" )!
            audioPlayer = try! AVAudioPlayer(contentsOf: sougURL)
            audioPlayer?.delegate = self
        }
        audioPlayer?.play()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: { [weak self] _ in
            self?.notifyDelegate()
        })
        
        notifyDelegate()
    }
    
    func pause(){
        audioPlayer?.pause()
        timer?.invalidate()
        timer = nil
        notifyDelegate()
    }
    
    private func notifyDelegate() {
        delegate?.playerDidChangeState(self)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        notifyDelegate()
    }
 }
