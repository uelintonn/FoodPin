//
//  ContentView.swift
//  FoodPin
//
//  Created by Uelinton Andrade 04/05/24.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:"Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl",  isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "HongKong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]
    
    
    
    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                BasicTextImageRow(restaurant: $restaurants[index])
            }
            
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        
        RestaurantListView()
            .preferredColorScheme(.dark)
    }
}

struct BasicTextImageRow: View {
    
    @Binding var restaurant: Restaurant
    
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(20)
            
            
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.yellow)
            }
            
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
            .onTapGesture {
                showOptions.toggle()
            }
            .actionSheet(isPresented: $showOptions) {
                ActionSheet(title: Text ("O que você deseja fazer?"),
                            message: nil,
                            buttons: [
                                .default(Text("1 - Reservar uma mesa")){
                                    self.showError.toggle()
                                },
                                .default(Text(restaurant.isFavorite ? "Desmarcar Favorita ": "2 - Marque como favorita")) {
                                    self.restaurant.isFavorite.toggle()
                                },
                                .cancel()
                            ])
            }
                .alert(isPresented: $showError) {
                    Alert (title: Text("Não está disponível"),
                           message: Text ("Desculpa esta função não está disponivel ainda, por favor volte depois."),
                           primaryButton: .default(Text("OK")),
                           secondaryButton: .cancel())
                }
                
                
                
            
                
            }
        
    }





