//
//  ViewController.swift
//  retroCalculator
//
//  Created by James Volmert on 9/6/16.
//  Copyright © 2016 James Volmert. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    
    // list of operations
    enum Operations: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = "Empty"
    var leftValString = ""
    var rightValString = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
           try btnSound = AVAudioPlayer(contentsOf: soundUrl)
            btnSound.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
            
        }
        
        
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        //code goes here
        playSound()
        
        runningNumber += " \(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
            
        }
        btnSound.play()
    }
    
    func processOrder(operation: Operations) {
        if currentOperation != Operations.Empty {
            
            // a user selects an operator after another oeprator
            
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operations.Multiply {
                    
                } else if currentOperation == Operations.Divide {
                
                }else if currentOperation == Operations.Add {
                }else if currentOperation == Operations.Subtract {
                    
                }
            }
        }
    }



}

