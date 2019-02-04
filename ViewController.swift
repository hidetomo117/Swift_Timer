//
//  ViewController.swift
//  Timer
//
//  Created by 益田英知 on 2019/02/04.
//  Copyright © 2019 Hidetomo Masuda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    private func setup() {
        
        /*
         <引数について>
         timeInterval: ループなら間隔、1度きりなら発動までの秒数
         target: メソッドを持つオブジェクト
         selector: 実行するメソッド
         userInfo: オブジェクトに付ける値
         repeats: 繰り返し実行するかどうか
         
         <その他>
         ・タイマーはインスタンスの生成されたスレッドで動く
         ・Initialize時にTimerを生成した場合は自ら実行ループ(Thread)へ登録する必要がある
            RunLoop.main.add(timer!, forMode: .defaultRunLoopMode)
         */
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(TimerDidFinish),
                                     userInfo: nil,
                                     repeats: true)

    }
    
    @objc private func TimerDidFinish() {

        guard let timer = timer else {
            return
        }
        // インスタンスの破棄
        timer.invalidate()
    }
    

}

