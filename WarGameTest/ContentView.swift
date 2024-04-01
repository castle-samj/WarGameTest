//
//  ContentView.swift
//  WarGameTest
//
//  Created by Samuel Castle on 3/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State var cardLeft = "back"
    @State var cardRight = "back"
    @State var scoreLeft = 0
    @State var scoreRight = 0

    var body: some View {

        ZStack {
            // bg image green
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()

            // main VStack
            VStack {

                Spacer()
                
                //icon image (WAR)
                Image("logo")

                Spacer()

                //HStack for cards
                HStack{
                    Spacer()
                    Image(cardLeft)
                    Spacer()
                    Image(cardRight)
                    Spacer()
                }
                
                Spacer()

                // DEAL image
                Button {
                    deal()
                } label: {
                    Image("button")
                }


                Spacer()
                
                //HStack for player scores
                HStack {

                    Spacer()
                
                    // VStack for player1
                    VStack {
                        Text("Player")
                        Text(String(scoreLeft))
                    }
                    
                    Spacer()

                    // VStack for player2
                    VStack {
                        Text("CPU")
                        Text(String(scoreRight))
                    }
                    
                    Spacer()
                }//end HStack for player scores
                .foregroundColor(.white)
                Spacer()

                Button("RESTART GAME", action: resetGame).foregroundColor(.red)
            } // end main VStack

        } //end ZStack
    } // end Body
    func deal() {
        // Randomize the cards
        cardLeft = randomCard()
        cardRight = randomCard()

        // compare the cards
        if cardLeft > cardRight {
            scoreLeft += 1
        }
        else if cardRight > cardLeft {
            scoreRight += 1
        }
        else {
            print("WAR")
        }
    }

    func randomCard() -> String {
        return "card" + String(Int.random(in: 2...14))
    }

    func resetGame() {
        cardLeft = "back"
        cardRight = "back"
        scoreLeft = 0
        scoreRight = 0
    }
} // end ContentView

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
