//
//  FirstViewController.swift
//  Do You Feel Lucky, Punk? Well Do Ya?
//
//  Created by rayaan on 26/02/19.
//  Copyright © 2019 Northwest. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var guessTV: UITextField!
    
    @IBOutlet weak var resultLBL: UILabel!
    
    @IBAction func AmIRightButton(_ sender: Any) {
       let guess = Int(guessTV.text!)
        if guess == nil{
            
        }else{
        
       let result = Guesser.shared.amIRight(guess: guess!)
        if result == "Too Low" || result == "Too High"{
            resultLBL.text = result
        }else{
            displayMessage()
            Guesser.shared.createNewProblem()
            clear()
        }//end of inner else
    
        }//end of else
            
    }//end of method AmIRightButton
    
    @IBAction func NewProblemButton(_ sender: Any) {
        Guesser.shared.createNewProblem()
    }//end of method NewProblemButton
    
    
    func displayMessage(){
        let alert = UIAlertController(title: "Well done",message: "You got it in \(Guesser.shared.numAttempts) tries",preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }//end of displayMessage method
    
    func clear(){
        resultLBL.text = ""
        guessTV.text = ""
    }//helper method for clearing tabs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }//end of viewDidLoad method

    
    
}//end of class


