//
//  ContentView.swift
//  Bank_App_SwiftUI
//
//  Created by Nagarajan on 14/09/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex: Int = 0
    var body: some View {
        ZStack{
            Color(hex: "#243249").edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderView()
                
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: false) {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                    CardView(selectedIndex: self.$selectedIndex, index: item).padding(.top, item == self.selectedIndex ? 70 : -20)
                                }
                            }
                        }
                        HStack {
                            FinancialCardView(title: "Monthly Incomes", amount: "$7500", imageName: "arrow.up")
                            Spacer()
                            FinancialCardView(title: "Monthly Expenses", amount: "$4500", imageName: "arrow.down")
                        }.padding(.top, 20)
                        
                        VStack {
                            TransactionHeaderView()
                            
                            List {
                                ForEach(0..<10) { item in
                                    
                                    TransactionListView()
                                }.listRowBackground(Color.clear)
                            }.listStyle(PlainListStyle())
                        }.frame(height:geo.size.height)
                        
                        
                    }
                }
                

                
                
                
                
                
                
                
            }.padding([.leading,.trailing])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Cards").font(.largeTitle).fontWeight(.bold)
            Spacer()
            
            Button(action: {
                // Your action goes here
                print("Button pressed")
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .bottom)
            }
            
            
            
            
        }.foregroundColor(.green).padding()
    }
}

struct CardView: View {
    @Binding var selectedIndex: Int
    let index: Int
    var body: some View {
        VStack(spacing: 10)
        {
            HStack {
                Image(systemName: "creditcard")
                Spacer()
                Image(systemName: "info.circle")
            }.padding()
            Spacer()
            Text("USD 35.6k").font(.largeTitle).fontWeight(.bold)
            Text("55Time used").font(.title).fontWeight(.regular)
            Spacer()
            HStack {
                Image(systemName: "creditcard")
                Spacer()
                Text("***1234")
            }.padding()
        }.frame(width: 180, height: 250).background(self.selectedIndex == index ? Color.init(hex: "#E1C29B" ): Color(hex: "#998") ).cornerRadius(10).onTapGesture(count: 1) {
            self.selectedIndex = self.index
        }
    }
}

struct FinancialCardView: View {
    let title: String
    let amount: String
    let imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName).resizable().frame(width: 15, height: 15, alignment: .bottom)
                Text(title)
            }.foregroundColor(.white)
            Text(amount).font(.title).fontWeight(.bold).foregroundColor(Color(hex: "#E1C29B"))
        }
    }
}

struct TransactionHeaderView: View {
    var body: some View {
        HStack {
            Text("Transaction").font(.title).foregroundColor(.white)
            Spacer()
            Button(action: {
                
            }) {
                Image(systemName: "slider.horizontal.3").resizable().frame(width:20,height:20, alignment: .bottomLeading).padding().background(Color.init(hex:"#323948")).cornerRadius(10).foregroundColor(Color(hex: "#E1C29B"))
            }
        }.padding()
    }
}

struct TransactionListView: View {
    var body: some View {
        HStack {
            Image(systemName: "creditcard").resizable().frame(width: 20, height: 20, alignment: .bottom).aspectRatio(contentMode: .fit).padding(15).background(Color(hex: "#2A3246")).foregroundColor(.white).cornerRadius(5).padding(.leading)
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Master Card").foregroundColor(.init(hex:"#E1C29B")).font(.headline).fontWeight(.bold)
                
                Text("A pair of shoes").foregroundColor(.white).font(.subheadline)
            }
            Spacer()
            Text(" $ 235").padding(.trailing).foregroundColor(.white).font(.caption)
            
        }.frame(height: 70)
            .background(Color.init(hex:"#32394D")).cornerRadius(10)
    }
}
