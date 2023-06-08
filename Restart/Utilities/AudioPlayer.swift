//
//  AudioPlayer.swift
//  Restart
//
//  Created by Ivan Nikitin on 30.05.2023.
//

import AVFoundation
import SwiftUI

private var audioPlayer: AVAudioPlayer?

public func playSound(sound: String, type: String) {
    audioPlayer?.stop()
    audioPlayer = nil
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Cound not play the sound file")
        }
    }
}
