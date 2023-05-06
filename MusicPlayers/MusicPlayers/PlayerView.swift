//
//  PlayerView.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import SwiftUI


struct PlayerView: View {
    @EnvironmentObject var audiomanager: audioManager
    var isPreview: Bool = false
    @State private var secs : Double = 0.0
    @Environment(\.dismiss) var dismiss
    var musicVM: MusicViewmodel
    @State private var isediting: Bool = false
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            VStack{
                
                HStack{
                    Button{
                        audioManager.shared.stop()
                        dismiss()
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                    }
                }
                
                Text(musicVM.music.title)
                
               
                //                if let player = audiomanager.player {
                if let player = audioManager.shared.player{
                    VStack{
                        Slider(value: $secs, in: 0...player.duration){
                            editing in
                            
                            isediting = editing
                            if !editing{
                                player.currentTime = secs
                            }
                        }
                            
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        
                    }.frame(width: 361)
                    
                    HStack{
                        let color: Color = audioManager.shared.islooping ? .teal : .red
                        PlaybackControllButton(systemname: "repeat", color: color){
                            audioManager.shared.toggleloop()
                        }
                        Spacer()
                        PlaybackControllButton(systemname: "gobackward.10"){
                            player.currentTime -= 10
                        }
                        Spacer()
                        PlaybackControllButton(systemname: audiomanager.isplaying ? "pause.circle.fill" : "play.circle.fill"){
                            audioManager.shared.playpause()
                        }
                        Spacer()
                        PlaybackControllButton(systemname: "goforward.10"){
                            player.currentTime += 10
                        }
                        Spacer()
                        PlaybackControllButton(systemname: "stop.fill"){
                            audioManager.shared.stop()
                            dismiss()
                        }
                        
                        
                    }.frame(width: 361)
                }
                //                }
                
            }
            
        }.onAppear{
            //            audioManager.shared.startPlayer(track: musicVM.music.track, isPreview: isPreview)
            audioManager.shared.startPlayer(track: musicVM.music.track, isPreview: isPreview)
//            audiomanager.startPlayer(track: musicVM.music.track, isPreview: isPreview)
        }
        .onReceive(timer){ _ in
            guard let player = audioManager.shared.player, !isediting else {return}
            secs = player.currentTime
            
        }
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let musicVM = MusicViewmodel(music: music.data)
    
    static var previews: some View {
        PlayerView(isPreview: true, musicVM: musicVM)
            .environmentObject(audioManager())
    }
}
