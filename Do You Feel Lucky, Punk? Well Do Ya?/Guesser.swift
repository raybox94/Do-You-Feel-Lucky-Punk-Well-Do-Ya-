//
//  Guesser.swift
//  Do You Feel Lucky, Punk? Well Do Ya?
//
//  Created by rayaan on 26/02/19.
//  Copyright © 2019 Northwest. All rights reserved.
//

import Foundation

class Guesser{
    
    static var shared = Guesser()
    
    private var correctAnswer:Int
    private var _numAttempts:Int
    private var guesses:[Guess]
    var numAttempts:Int{
        return _numAttempts
    }//end of computed property
    
    private convenience init(){
        let random = Int.random(in: 1...10)
        self.init(correctAnswer: random,_numAttempts: 0,guesses: [])
    }//end of no argument initializer
    
    init(correctAnswer:Int, _numAttempts:Int,guesses:[Guess]){
        self.correctAnswer = correctAnswer
        self._numAttempts = _numAttempts
        self.guesses = guesses
    }//end of initializer
    
    func createNewProblem(){
        correctAnswer = Int.random(in: 1...10)
        _numAttempts = 0
    }//end of methos createNewProblem
    
    func amIRight(guess:Int) -> String{
        _numAttempts = _numAttempts + 1
        if guess < correctAnswer{
            return Result.tooLow.rawValue
        }else if guess > correctAnswer{
            return Result.tooHigh.rawValue
        }else{
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct.rawValue
        }
    }//end of method amIRight
    
    func guess(index:Int) ->Guess {
        return guesses[index]
    }//end of method guess
    
    func numGuesses()->Int{
        return guesses.count
    }//end of method numGuesses
    
    func clearStatistics(){
        guesses = []
    }//end of method clearStatistics()
    
    func minimumNumAttempts() ->Int{
        
        if guesses.isEmpty{
            return 0
        }else{
        var minimum = guesses[0].numAttemptsRequired
        for i in guesses{
            if minimum > i.numAttemptsRequired{
                minimum = i.numAttemptsRequired
            }
        }//end of for loop
        
        return minimum
        }//end of else
            
    }//end of method minimumNumAttempts
    
    func  maximumNumAttempts() ->Int{
        
        if guesses.isEmpty{
            return 0
        }else{
        var maximum = guesses[0].numAttemptsRequired
        for i in guesses{
            if maximum < i.numAttemptsRequired{
                maximum = i.numAttemptsRequired
            }
        }//end of for loop
        return maximum
        }//end of else
    }//end of method maximumNumAttempts
    
    func mean() ->Double{
        if guesses.isEmpty{
            return 0
        }else{
     var mean = 0.0
     var sum = 0.0
        for i in guesses{
            sum = sum + Double(i.numAttemptsRequired)
        }//end of for loop
        mean = sum/Double(numGuesses())
        return mean
        }//end of else
    }//end of method mean
    
    func stdDiv() -> Double{
        if guesses.isEmpty{
            return 0
        }else{
        var temp = 0.0
        var stDiv = 0.0
        for i in guesses{
            let temp1 = pow(Double(i.numAttemptsRequired)-mean(),2)
            temp = temp + temp1
        }//end of for loop
        stDiv = sqrt(temp/Double(numGuesses()))
        return stDiv
        }//end of else
    }//end of loop
    
}//end of class

struct Guess {
    var correctAnswer:Int
    var numAttemptsRequired:Int
}//end of struct

enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}
