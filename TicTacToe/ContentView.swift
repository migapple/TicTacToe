//
//  ContentView.swif
//  TicTacToe 2
//
//  Created by Michel Garlandat on 02/03/2020.
//  Copyright © 2020 Michel Garlandat. All rihts reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var activePlayer = 1 // Croix
    @State private var gameState = Array(repeating: 0, count: 9)
    @State private var affichePion = Array(repeating: "Vide", count: 9)
    @State private var animationAmount = 0
    @State private var open = false
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @State private var gameIsActive = true
    @State private var buttonHidden = true
    @State private var affichage = "Tic Tac Toe"
    @State private var pion = "Vide"
    @State private var joueur = 0
    @State private var ordi = 0
    @State private var partiesJoueur = UserDefaults.standard.integer(forKey: "partiesJoueur")
    @State private var partiesOrdi = UserDefaults.standard.integer(forKey: "partiesOrdi")
    @State private var quiDemarre = true
    @State private var selection = 0

    var body: some View {
        
        VStack {
            Text(affichage)
                .font(.headline)
                .padding()
            HStack {
                Text("Joueur: \(partiesJoueur)")
                    .font(.headline)
                Text("Ordi: \(partiesOrdi)")
                    .font(.headline)
            }
            
            // Rangée une
            HStack {
                Button(action: {
                    self.traiteBouton(0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                        
                    withAnimation {
                        self.animationAmount += 360
                    }
                    
                }) {
                    Image(affichePion[0])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                
                
                Button(action: {
                    self.traiteBouton(1)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[1])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                Button(action: {
                    self.traiteBouton(2)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[2])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
            }
            
            // Rangée deux
            HStack {
                Button(action: {
                    self.traiteBouton(3)
                     DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[3])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                Button(action: {
                    self.traiteBouton(4)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[4])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                Button(action: {
                    self.traiteBouton(5)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[5])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
            }
            
            // Rangée trois
            HStack {
                Button(action: {
                    self.traiteBouton(6)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[6])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                Button(action: {
                    self.traiteBouton(7)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[7])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
                
                Button(action: {
                    self.traiteBouton(8)
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.ordinateur)
                    
                }) {
                    Image(affichePion[8])
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100,height: 100)
                }
                .animation(Animation.easeInOut(duration: 0.6))
            }
        
            // Parametres
            HStack {
                Toggle(isOn: $quiDemarre) {
                    Text("Joueur/Ordi")
                }
                
                .padding()
                
                Picker(selection: $selection, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Facile").tag(1)
                    Text("Moyen").tag(2)
                    Text("Dur").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            
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
                            .font(.headline)
                            .padding(.top, 20)
                            .clipped()
                    } else {
                        Text("")
                            .font(.headline)
                            .padding(.top, 20)
                            .clipped()
                    }
                }
                
                
                // Ordinateur
                Button(action: {
                    if self.quiDemarre == true {
                        
                        self.ordinateur()
                    }
                }) {
                    if !gameIsActive {
                        Text("")
                            .font(.body)
                            .padding(.top, 20)
                            .clipped()
                    } else
                        
                        if self.ordi == 0 && self.joueur == 1 {
                            Text("Ordi")
                                .foregroundColor(.red)
                                .font(.body)
                                .padding(.top, 20)
                                .clipped()
                        } else
                            
                            if self.joueur == 0 && self.ordi == 1 {
                                Text("Joueur")
                                    .foregroundColor(.green)
                                    .font(.body)
                                    .padding(.top, 20)
                                    .clipped()
                            } else
                                
                                if self.joueur == 0 && self.ordi == 0 {
                                    Text("Joueur/Ordi")
                                        .font(.body)
                                        .padding(.top, 20)
                                        .clipped()
                    }
                }
                
                
                // RAZ
                Button(action: {
                    self.partiesOrdi = 0
                    self.partiesJoueur = 0
                    self.gameState = Array(repeating: 0, count: 9)
                    self.affichePion = Array(repeating: "Vide", count: 9)
                    self.gameIsActive = true
                    self.affichage = "Tic Tac Toe"
                    self.buttonHidden = true
                    self.activePlayer = 1
                    UserDefaults.standard.set(self.partiesOrdi, forKey: "partiesOrdi")
                    UserDefaults.standard.set(self.partiesJoueur, forKey: "partiesJoueur")
                    
                }) {
                    Text("Raz")
                        .font(.body)
                        .padding(.top, 20)
                        .clipped()
                }
            }
        }
    }
    
    
    func ordinateur() {
        var trouve = false
        if ordi == 0 && gameIsActive {
            self.activePlayer = 2
            // On regarde s'il reste des places non jouées
            for gameState in self.gameState {
                if gameState == 0 {
                    self.gameIsActive = true
                    break
                }
            }
            
            if selection == 0 {
                trouve = false
            }
            
            // l'ordinateur cherche à bien joueur
            // Verifie si 2 case de l'ordinateur en ligne
            if selection == 1 {
                trouve = chercheCombinaison(joueur: 2)
            }
            // l'ordinateur cherche à contrer le joueur
            // Verifie si 2 case du joueur en ligne
            
            if selection == 1 || selection == 2 {
                if !trouve {
                    trouve = chercheCombinaison(joueur: 1)
                }
            }
            
            // Si il n'y a pas deux cases en ligne l'ordinateur joue au hasard
            if !trouve {
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
    }
    
    func chercheCombinaison(joueur: Int) -> Bool {
        
        var trouve = false
        
        for combination in winningCombinations {
            // Une conbinaison trouvée
            
            var nbState = 0
            
            if gameState[combination[0]] == joueur { nbState += 1}
            if gameState[combination[1]] == joueur { nbState += 1}
            if gameState[combination[2]] == joueur { nbState += 1}
            
            
            if nbState == 2 {
                var j = 0
                for _ in combination {
                    if gameState[combination[j]] == 0 {
                        
                        self.traiteBouton(combination[j])
                        trouve = true
                    }
                    j += 1
                }
            }
        }
        
        return trouve
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
//                print("\(#function) \(#line)")
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
                    partiesJoueur += 1
                    UserDefaults.standard.set(self.partiesJoueur, forKey: "partiesJoueur")
                    
                    
                } else {
                    // Nought has won
                    affichage = "Les ronds on gagné"
                    partiesOrdi += 1
                    UserDefaults.standard.set(self.partiesOrdi, forKey: "partiesOrdi")
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
