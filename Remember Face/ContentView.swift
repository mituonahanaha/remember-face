//
//  ContentView.swift
//  Remember Face
//
//  Created by Shimpei on 2023/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var isShowSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Remember Face")
                    .font(.system(size: 40, weight: .heavy, design: .serif))
                    .foregroundColor(Color.white)
                    .padding(.top,120)
                
                Spacer()
                Button {
                    isShowSheet.toggle()
                } label: {
                    Text("START")
                        .font(.system(size: 60, weight: .heavy, design: .serif))
                        .padding(.bottom,95)
                        .foregroundColor(Color.white)
                        .frame(height: 300.0)
                }
                .fullScreenCover(isPresented:$isShowSheet){
                    ImageSelectView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

