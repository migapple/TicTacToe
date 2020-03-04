//
//  ContentView.swift
//  TicTacToe 2
//
//  Created by Michel Garlandat on 02/03/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var activePlayer = 1 // Croix
    @State private var gameState = Array(repeating: 0, count: 9)
    @State private var affichePion = Array(repeating: "Vide", count: 9)
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @State private var gameIsActive = true
    @State private var buttonHidden = true
    @State private var affichage = "Tic Tac Toe"
    @State private var gameEnded = false
    @State private var pion = "Vide"
    @State private var joueur = 0
    @State private var ordi = 0
    
    var body: some View {
        ZStack {
            //            Image("Board")
            //                .resizable()
            //                .frame(width: 400, height: 300)
            //                .offset(y: -40)
            VStack {
                Text(affichage)
                    .font(.system(size: 6))
                    .padding()
                // Rangée une
                HStack {
                    Button(action: {
                        self.traiteBouton(0)
                        
                    }) {
                        Image(affichePion[0])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(1)
                        
                    }) {
                        Image(affichePion[1])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(2)
                        
                    }) {
                        Image(affichePion[2])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                }
                
                // Rangée deux
                HStack {
                    Button(action: {
                        self.traiteBouton(3)
                        
                    }) {
                        Image(affichePion[3])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(4)
                        
                    }) {
                        Image(affichePion[4])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(5)
                        
                    }) {
                        Image(affichePion[5])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                }
                
                // Rangée trois
                HStack {
                    Button(action: {
                        self.traiteBouton(6)
                        
                    }) {
                        Image(affichePion[6])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(7)
                        
                    }) {
                        Image(affichePion[7])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                    
                    Button(action: {
                        self.traiteBouton(8)
                        
                    }) {
                        Image(affichePion[8])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height: 20)
                    }
                }
                
                // Rejouer
                HStack {
                    Button(action: {
                        self.gameState = Array(repeating: 0, count: 9)
                        self.affichePion = Array(repeating: "Vide", count: 9)
                        self.gameIsActive = true
                        self.affichage = "Tic Tac Toe"
                        self.buttonHidden = true
                        self.activePlayer = 1
                    }) {
                        if !buttonHidden {
                            Text("Rejouer")
                                .font(.system(size: 6))
                                .padding(.top, 20)
                                .clipped()
                        } else {
                            Text("")
                                .font(.system(size: 6))
                                .padding(.top, 20)
                                .clipped()
                        }
                    }
                    
                    // Ordinateur
                    Button(action: {
                        self.ordinateur()
                    }) {
                        Text("Ordi")
                        .font(.system(size: 6))
                        .padding(.top, 20)
                        .clipped()
                    }
                }
            }
        }.scaleEffect(5)
    }
    
    func ordinateur() {
        if ordi == 0 && gameIsActive {
            self.activePlayer = 2
            // On regarde s'il reste des places non jouées
            for gameState in self.gameState {
                if gameState == 0 {
                    self.gameIsActive = true
                    break
                }
            }
            
            while true {
                let ordi = Int.random(in: 0...self.gameState.count - 1)
                if self.gameState[ordi] == 0 {
                    self.activePlayer = 2
                    self.traiteBouton(ordi)
                    break
                }
            }
        }
    }
    
    func traiteBouton(_ bouton: Int) {
        // On verifie que l'on n'a pas joué à cet endroit
        if gameState[bouton] == 0 && gameIsActive == true {
            
            
            if (self.activePlayer == 1) && joueur == 0 {
                // On met le player dans gameState
                self.gameState[bouton] = activePlayer
                self.affichePion[bouton] = "Croix"
                joueur = 1
                ordi = 0
            }
            
            if self.activePlayer == 2 && ordi == 0 {
                // On met le player dans gameState
                self.gameState[bouton] = activePlayer
                self.affichePion[bouton] = "Rond"
                self.activePlayer = 1
                ordi = 1
                joueur = 0
            }
        }
        
        test()
    }
    
    func test() {
        for combination in winningCombinations {
            // Une conbinaison trouvée
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                self.gameIsActive = false
                buttonHidden = false
                
                if gameState[combination[0]] == 1 {
                    // Cross has won
                    affichage = "Les croix on gagné"
                    
                } else {
                    // Nought has won
                    affichage = "Les ronds on gagné"
                }
            }
        }
        
        // Si on n'a pas une combinaison gagnante
        if gameIsActive {
            self.gameIsActive = false
            
            // On regarde s'il reste des places non jouées
            for i in gameState {
                if i == 0 {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false {
                affichage = "Plus de combinaisons"
                buttonHidden = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
