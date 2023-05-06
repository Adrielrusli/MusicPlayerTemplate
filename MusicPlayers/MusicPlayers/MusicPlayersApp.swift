//
//  MusicPlayersApp.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import SwiftUI

@main
struct MusicPlayersApp: App {
    @StateObject var audiomanager = audioManager()
    @StateObject var audiomanager1 = audioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audiomanager)
                .environmentObject(audiomanager1)
        }
    }
}
