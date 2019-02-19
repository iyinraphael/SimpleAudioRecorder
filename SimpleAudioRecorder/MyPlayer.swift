 //
//  MyPlayer.swift
//  SimpleAudioRecorder
//
//  Created by Iyin Raphael on 2/19/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation
import AVFoundation
 

 class Player: NSObject {
    
    private var audioPlayer: AVAudioPlayer?
    
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
        }
        audioPlayer?.play()
    }
    
    func pause(){
        audioPlayer?.pause()
    }
 }
