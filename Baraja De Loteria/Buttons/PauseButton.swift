//
//  PauseButton.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/28/23.
//

import SwiftUI

struct PauseButton: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.pink)
                .frame(width: UIScreen.main.bounds.width * 0.25,height: 200)
            Image(systemName: "pause.fill").foregroundColor(.white)
        }
    }
}

#Preview {
    PauseButton()
}
