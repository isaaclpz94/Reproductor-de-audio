//
//  ViewController.swift
//  ReproductorAudio
//
//  Created by Isaac Mac on 29/9/16.
//  Copyright (c) 2016 Isaac Mac. All rights reserved.
//

import UIKit
import AVFoundation

var reproductorAudio = AVAudioPlayer()

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ubicacionAudio = NSBundle.mainBundle().pathForResource("Foyone", ofType: "mp3")
        var elAudio = NSURL(fileURLWithPath: ubicacionAudio!)
        reproductorAudio = AVAudioPlayer(contentsOfURL: elAudio, error: nil)
        reproductorAudio.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPlay(sender: UIButton) {
        reproductorAudio.play()
        controlBotones(true)
    }
    
    @IBAction func btnPause(sender: UIButton) {
        reproductorAudio.pause()
        controlBotones(false)
    }
    
    @IBAction func btnStop(sender: UIButton) {
        reproductorAudio.stop()
        reproductorAudio.currentTime = 0
        controlBotones(false)
    }

    
    @IBAction func SliderVolumen(sender: AnyObject) {
        reproductorAudio.volume = outVolumen.value
    }
    
    @IBOutlet var outVolumen: UISlider!
    @IBOutlet var outPlay: UIButton!
    @IBOutlet var outPause: UIButton!
    @IBOutlet var outStop: UIButton!
    
    func controlBotones(reproduciendo:Bool){
        outPlay.enabled = !reproduciendo
        outPause.enabled = reproduciendo
        outStop.enabled = reproduciendo
    }
}

