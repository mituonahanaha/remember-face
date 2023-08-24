//
//  GameStartView.swift
//  Remember Face
//
//  Created by Shimpei on 2023/08/24.
//

import SwiftUI

struct GameStartView: View {
    let SoundPlay = SoundPlayer()
    let captureImage: UIImage
    var answer = Int.random(in: 1...16)
    @State var Count = 0
    @State var isShowSheet: Bool = false
    @State var array = Array(repeating: [Int](repeating: 1,count: 4),count: 4)
    
    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Don't Pick Miss")
                    .font(.system(size: 40, weight: .heavy, design: .serif))
                    .foregroundColor(Color.white)
                    .offset(x: 0,y: 25)
                    .padding(.bottom, 40)
                
                ForEach(0..<4){k in
                    HStack {
                        ForEach(0..<4) {i in
                            Button {
                                if array[k][i] != 0{
                                    array[k][i]=0
                                    Count+=1
                                    SoundPlay.PlayA()
                                }
                                if Count == answer {
                                    SoundPlay.PlayB()
                                    isShowSheet.toggle()
                                }
                            } label: {
                                if array[k][i] == 1 {
                                    Image(uiImage: captureImage)
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 80.0,height: 140.0)
                                } else {
                                    Image("")
                                        .resizable()
                                        .scaledToFit()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 95.0,height: 140)
                                }
                            }
                            .frame(width: 90.0, height: 130.0)
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowSheet) {
                GameLoseView(captureImage: captureImage)
            }
        }
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView(captureImage: UIImage(named: "AppIcon")!)
    }
}
