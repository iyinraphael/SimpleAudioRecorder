//
//  Recorder.swift
//  SimpleAudioRecorder
//
//  Created by Iyin Raphael on 2/19/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

import Foundation
import AVFoundation

class Recorder: NSObject {
    
    private var audioRecoder: AVAudioRecorder?
    private(set) var currentFile: URL?
    
    var isRecording: Bool {
        return audioRecoder?.isRecording ?? false
    }
    
    func toggleRecording(){
        if isRecording{
            stop()
        }else {
            record()
        }
    }
    
    func record(){
        let fm = FileManager.default
        let docDir = try! fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        //pick a name that reflects when we're starting to record
        let name = ISO8601DateFormatter.string(from: Date(), timeZone: .current, formatOptions: [.withInternetDateTime])
        let file = docDir.appendingPathComponent(name)
                    .appendingPathExtension("caf")
        
        //format for single mono audio recording 
        let format = AVAudioFormat(standardFormatWithSampleRate: 44_100, channels: 1)!
        audioRecoder = try! AVAudioRecorder(url: file, format: format)
        currentFile = file
        
        audioRecoder?.record()
        
    }
    
    func stop(){
        audioRecoder?.stop()
        audioRecoder = nil
    }
    
}
