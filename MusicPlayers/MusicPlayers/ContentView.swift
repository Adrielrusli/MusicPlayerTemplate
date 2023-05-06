//
//  ContentView.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MusicView(musicVM: MusicViewmodel(music: music.data))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(audioManager())
    }
}
