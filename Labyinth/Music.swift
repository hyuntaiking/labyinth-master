//
//  Music.swift
//  Labyinth
//
//  Created by Hyuntai on 2017/7/28.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound(name: String, numberOfLoops: Int) {
    guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url)
        guard let player = player else { return }
        player.numberOfLoops = numberOfLoops
        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}
