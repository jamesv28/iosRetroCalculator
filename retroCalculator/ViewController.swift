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
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
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
        
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        //code goes here
        playSound()
        
        runningNumber += " \(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOrder(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOrder(operation: .Multiply)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOrder(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOrder(operation: .Subtract)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOrder(operation: currentOperation)
    }
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
            
        }
        btnSound.play()
    }
    
    func processOrder(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            
            // a user selects an operator after another oeprator
            
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"

                }else if currentOperation == Operation.Add {
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"

                }
                leftValString = result
                outputLbl.text = result
            }
            currentOperation = operation
        } else {
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }



}

