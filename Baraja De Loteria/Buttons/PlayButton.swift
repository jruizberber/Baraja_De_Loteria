//
//  PlayButton.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/28/23.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        
        ZStack{
            Circle()
                .fill(.green)
                .frame(width: UIScreen.main.bounds.width * 0.25,height: 200)
            Image(systemName: "play.fill").foregroundColor(.white)
        }
        
    }
}

#Preview {
    PlayButton()
}
