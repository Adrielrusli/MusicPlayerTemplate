//
//  PlaybackControllButton.swift
//  MusicPlayers
//
//  Created by Adriel Bernard Rusli on 29/04/23.
//

import SwiftUI

struct PlaybackControllButton: View {
    var systemname: String = "play"
    var fontsize: CGFloat = 24
    var color: Color = .blue
    var action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label: {
           Image(systemName: systemname)
                .font(.system(size: fontsize))
                .foregroundColor(color)
        }
    }
}

struct PlaybackControllButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControllButton(action: {})
    }
}
