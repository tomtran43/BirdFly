//
//  ViewController.swift
//  BirdFly
//
//  Created by Loc Tran on 2/16/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
        
    }
    
    func drawJungle(){
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
        
    }
    
    func addBird(){
        bird = UIImageView(frame: CGRect(x: 0,y: 0,width: 110,height: 68))
        bird.animationImages = [UIImage(named: "bird0.png")!,
                                UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!] // khai bao animationImages la 1 array
        bird.animationRepeatCount = 0 // repeat vo tan, neu dat = 1 thi anh chi chay 1 lan
        bird.animationDuration = 1 // toc do load anh
        bird.startAnimating()
        self.view.addSubview(bird)
        
    }
    
    func flyUpAndDown(){
        UIView.animate(withDuration: 4,
                       animations: {self.bird.center = CGPoint(x: self.view.bounds.size.width-20, y: self.view.bounds.size.height-20)},
                       completion: {(finished) in
                        var t = CGAffineTransform.identity
                        t = t.scaledBy(x: -1, y: 1)
                        self.bird.transform = t
                        UIView.animate(withDuration: 4,
                                       animations: {self.bird.center = CGPoint(x: 20, y: self.view.bounds.size.height-20)},
                                       completion: {(finished) in
                                        var t = CGAffineTransform.identity
                                        t = t.rotated(by: -45)
                                        self.bird.transform = t
                                        UIView.animate(withDuration: 4,
                                                       animations: {self.bird.center = CGPoint(x: self.view.bounds.size.width, y: 20)},
                                                       completion: {(finished) in
                                                        var t = CGAffineTransform.identity
                                                        t = t.scaledBy(x: -1, y: 1)
                                                        self.bird.transform = t
                                                        UIView.animate(withDuration: 4,
                                                                       animations: {self.bird.center = CGPoint(x: 20, y:20)},
                                                                       completion: {(finished) in
                                                                        self.bird.transform = CGAffineTransform.identity
                                                                        self.flyUpAndDown()
                                                        })
                                                        
                        })
        })
    })
    }
    
    func playSong(){
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: ".mp3")!))
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    

}

