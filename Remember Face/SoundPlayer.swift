//
//  SoundPlayer.swift
//  Remember Face
//
//  Created by Shimpei on 2023/08/24.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let PatterA = NSDataAsset(name: "success")!.data
    let PatterB = NSDataAsset(name: "lose")!.data
    let PatterC = NSDataAsset(name: "start")!.data
    var PlayerA: AVAudioPlayer!
    var PlayerB: AVAudioPlayer!
    var PlayerC: AVAudioPlayer!
    
    func PlayA() {
        do {
            PlayerA = try AVAudioPlayer(data: PatterA)
            PlayerA.play()
        } catch {
            print("")
        }
    }
    
    func PlayB() {
        do {
            PlayerB = try AVAudioPlayer(data: PatterB)
            PlayerB.play()
        } catch {
            print("")
        }
    }
    
    func PlayC() {
        do {
            PlayerC = try AVAudioPlayer(data: PatterC)
            PlayerC.play()
        } catch {
            print("")
        }
    }
}

