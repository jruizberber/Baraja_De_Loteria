//
//  SecondaryScreen.swift
//  Baraja De Loteria
//
//  Created by Julio Ruiz on 12/27/23.
//

import SwiftUI

struct SecondaryScreen: View {
    
    @State var currentCard: String = "Card_Back"
    @State var dealingPaused: Bool = false
    @State var dealingDeck = false;
    
    // Instantiate array of card names
    @State private var cards: [String] = {
        var array = [String]()
        for i in 1...54{
            array.append("Loteria_Card_\(i)")
        }
        return array.shuffled()
    }()
    
    @State private var cardsPlayed = [String]()

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
                    
                    ForEach(0..<cardsPlayed.count, id: \.self){
                        index in
                            Image(cardsPlayed[index])
                                .resizable()
                                .scaledToFit()
                                //.ignoresSafeArea()
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .shadow(color: .black, radius: 2, x:-1, y:-1)
//                                .stacked(at: index, in: .cardsPlayed.count)
                                .offset(x: 0, y: Double(index * 2))
                    }
                    
//                    Image("Card_Back")
//                        .resizable()
//                        .scaledToFit()
//                        //.ignoresSafeArea()
//                        .frame(width: UIScreen.main.bounds.width * 0.8)
//                        .shadow(color: .black, radius: 2, x:-1, y:-1)
                    
                    //let _ = print("printing..")
                }
                
                Spacer()
                
                if !dealingDeck{
                    Button(action: {
                        dealingDeck = true
                        
                        if dealingPaused{
                            //Resume dealing
                            dealingPaused = false
                        }
                        for i in 1...54{
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i-1) * 0.25){
                                cardsPlayed.append(cards.removeLast())
                            }
                        }
                        
                    }, label: {
                        PlayButton()
                    })
                }else{
                    Button(action: {
                        dealingDeck = false
                        dealingPaused = true
                        
                    }, label: {
                        PauseButton()
                    })
                }
                
                
                
                
            }
        }
    }
}



#Preview {
    SecondaryScreen()
}
