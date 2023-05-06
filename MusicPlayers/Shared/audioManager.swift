//
//  audioManager.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import Foundation
import AVKit
import AVFoundation
import WatchConnectivity

final class audioManager: ObservableObject{
    @Published private(set) var islooping: Bool = false

    static let shared = audioManager()
    var player: AVAudioPlayer?
    @Published private(set) var isplaying: Bool = false{
        didSet{
            print("isplaying", isplaying)
        }
    }

    func startPlayer(track: String , isPreview: Bool = false){
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resources not found: \(track)")
            return
        }

        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)

            if isPreview{
                player?.prepareToPlay()
            }else{

                player?.play()
                isplaying = true
            }
        }catch{
            print("Failed to initialized player", error)
        }
    }

    func playpause(){
        guard let player = player else{
            print("Instance of audi player no found")
            return
        }

        if player.isPlaying{
            player.pause()
            isplaying = false
        }else{
            player.play()
            isplaying = true

        }
    }

    func stop(){
        guard let player = player else {return}

        if player.isPlaying{
            player.stop()
            isplaying = false

        }
    }

    func toggleloop(){
        guard let player = player else {return}

        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        islooping = player.numberOfLoops != 0
        print("islooping")
    }
}


