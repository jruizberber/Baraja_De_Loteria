//
//  StartingScreen.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/27/23.
//

import SwiftUI

struct StartingScreen: View {

    var body: some View {

        ZStack{
            
            Color("Yellow_Loteria").ignoresSafeArea()
            
            VStack {
                Spacer()

                Text("Loteria!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Spacer()
                Image("Cards_Extended")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .shadow(radius: 5, y:15)
                    //.background(.green)
                Spacer()

                NavigationLink(destination: SecondaryScreen()){
                    StartButton()
                }
                Spacer()
                Spacer()
                
            }
        }
    }
}

#Preview {
    StartingScreen()
}
