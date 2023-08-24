//
//  GameLoseView.swift
//  Remember Face
//
//  Created by Shimpei on 2023/08/24.
//

import SwiftUI

struct GameLoseView: View {
    let captureImage: UIImage
    let SoundPlay = SoundPlayer()
    @State var isShowSheet: Bool = false
    @State var isShowSheet2: Bool = false
    
    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("LOSE")
                    .font(.system(size: 55, weight: .heavy, design: .serif))
                    .frame(maxWidth: 150)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding(.top, 107.0)
                
                Image(uiImage: captureImage)
                    .resizable()
                    .padding(.bottom)
                    .scaledToFit()
                    .offset(x: 0,y: 0)
                
                Spacer()
                Button {
                    isShowSheet.toggle()
                } label: {
                    Text("Change Photo")
                        .font(.system(size: 25, weight: .heavy, design: .serif))
                        .frame(maxWidth: 360)
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                }
                .fullScreenCover(isPresented: $isShowSheet){
                    ImageSelectView()
                }
                
                Button {
                    SoundPlay.PlayC()
                    isShowSheet2.toggle()
                } label: {
                    Text("Revenge")
                        .font(.system(size: 25, weight: .heavy, design: .serif))
                        .frame(maxWidth: 360)
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .padding(.bottom,110)
                }
                .fullScreenCover(isPresented: $isShowSheet2){
                    GameStartView(captureImage: captureImage)
                }
            }
        }
    }
}


struct GameLoseView_Previews: PreviewProvider {
    static var previews: some View {
        GameLoseView(captureImage: UIImage(named: "AppIcon")!)
    }
}

