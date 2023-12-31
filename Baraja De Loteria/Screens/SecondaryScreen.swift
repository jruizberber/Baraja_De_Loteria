//
//  SecondaryScreen.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/27/23.
//

import SwiftUI


struct SecondaryScreen: View {
    
    @State var currentCard: String = "Card_Back"
    @State var pauseButtonOn: Bool = false
    @State var dealingDeck = false;
    
    // Instantiate array of card names
    @State private var cards: [String] = {
        var array = [String]()
        for i in 1...54{
            array.append("Loteria_Card_\(i)")
        }
        return array
    }()

    // Timer Variable
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

//    func startDealing() {
//
//        currentCard = ("Loteria_Card_1")
//
//        for i in 2...3{
//            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i-1) * 3){
//                currentCard = ("Loteria_Card_\(i)")
//                print(currentCard)
//                
//            }
//        }
//    }
    
    
    var body: some View {


        ZStack(){
            Image("Billard Felt")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                            

            VStack{
                ZStack{
                    // Background Card Back
                    Image("Card_Back")
                        .resizable()
                        .scaledToFit()
                        //.ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .shadow(color: .black, radius: 2, x:-1, y:-1)
                    
                    //let _ = print("printing..")
                    
                    // Second Card
                    Image(currentCard)
                        .resizable()
                        .scaledToFit()
                        //.ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                        .shadow(color: .black, radius: 2, x:0, y:0)
                        .offset(x:3, y: 3)
                        //.animation(.easeInOut(duration: 3).delay(1), value: currentCard)
                }
                
                // Play/Pause Button
                Button(action: {
                    pauseButtonOn.toggle()

                    if(dealingDeck == false){
                        // Deal Deck
                        dealingDeck.toggle()
                        print("Started Dealing Cards")
                        cards.shuffle()
                        for (i, card) in cards.enumerated(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i-1) * 3){
                                currentCard = card
                            }
                        }
                        
                        //Test
                        //Test2
                    }
                    //startDealing()
                    else if(pauseButtonOn){
                        //Game Paused by User
                        // TODO - Implement pause code
                        
                    }
                    
                    // If Paused Button
                }, label: {
                    // Play and Pause Labels
                    if pauseButtonOn {
                        PauseButton()
                        let _ = print("pause button view toggled")
                    }
                    else{
                        PlayButton()
                        let _ = print("play button view toggled")
                    }
                })
            }
        }
    }
}



#Preview {
    SecondaryScreen()
}
