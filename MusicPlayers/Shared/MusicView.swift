//
//  MusicView.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import SwiftUI

struct MusicView: View {
    @StateObject var musicVM: MusicViewmodel
    @State private var showPlayer = false
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Music")
                    Text(DateComponentsFormatter.abbreviated.string(from: musicVM.music.duration) ?? musicVM.music.duration.formatted() + "S")
                   
                }.textCase(.uppercase)
                    .opacity(0.7)
                
                   
                
                Text(musicVM.music.title)
                
                Button{
                    showPlayer = true
                }label: {
                    Label("play", systemImage: "play.fill")
                        .font(.headline)
                }
                
                Text(musicVM.music.description)
                
                
                // kalo mo matiin dri musicview
//                Button{
//                    audioManager.shared.stop()
//                }label: {
//                    Text("Test Stop")
//                }
                
            }.frame(maxWidth: 361)
                
        }
        
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(musicVM: musicVM)
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    
    static let musicVM = MusicViewmodel(music: music.data)
    static var previews: some View {
        MusicView(musicVM: musicVM)
            .environmentObject(audioManager())
    }
}
