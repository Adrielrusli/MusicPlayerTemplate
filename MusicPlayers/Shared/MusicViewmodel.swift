//
//  MusicViewmodel.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import Foundation



final class MusicViewmodel: ObservableObject{
    private(set) var music: music
    
    init(music: music) {
        self.music = music
    }
}

struct music{
    
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    
    static let data = music(title: "Music", description: "Ini music loh", duration: 70, track: "Alan Walker - Dreamer [NCS Release]")
    
}
