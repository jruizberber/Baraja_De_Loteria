//
//  StartButton.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/27/23.
//

import SwiftUI

struct StartButton: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.red)
                .frame(width: 200,height: 200)
            Text("START!")
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    StartButton()
}
