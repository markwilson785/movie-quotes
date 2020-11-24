//
//  GameViewController.swift
//  movieQuotes
//
//  Created by Mark Wilson on 9/9/20.
//  Copyright © 2020 Mark Wilson. All rights reserved.
//

import UIKit
import Combine

class GameViewController: UIViewController {
    
    var timerCancelable: AnyCancellable?
    var timerCount = 30
    var isTeam1Turn = true
    
    
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
  
    @IBOutlet weak var team2Stepper: UIStepper!
    @IBOutlet weak var team1Stepper: UIStepper!
    
    @IBOutlet weak var displayQuoteLabel: UILabel!
    @IBOutlet weak var displayMovieTitleLabel: UILabel!
    @IBOutlet weak var displayCharacterNameLabel: UILabel!
    
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var passButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1Stepper.setDecrementImage(team1Stepper.decrementImage(for: .normal), for: .normal)
        team1Stepper.setIncrementImage(team1Stepper.incrementImage(for: .normal), for: .normal)
        team2Stepper.setDecrementImage(team2Stepper.decrementImage(for: .normal), for: .normal)
        team2Stepper.setIncrementImage(team2Stepper.incrementImage(for: .normal), for: .normal)
        updateGameUI(isPlaying: false)
    }
    
    func populateNewQuote() {
        let movieQuote = MovieQuotesController.singleton.getRandomQuote()
        displayQuoteLabel.text = movieQuote.text
        displayCharacterNameLabel.text = movieQuote.characterName
        displayMovieTitleLabel.text = movieQuote.movieTitle
        updateGameUI(isPlaying: true)
    }
    
    func updateGameUI(isPlaying: Bool) {
        displayQuoteLabel.isHidden = !isPlaying
        displayCharacterNameLabel.isHidden = !isPlaying
        displayMovieTitleLabel.isHidden = !isPlaying
        correctButton.isHidden = !isPlaying
        passButton.isHidden = !isPlaying
        timerLabel.isHidden = !isPlaying
        team1Label.isHidden = isPlaying && !isTeam1Turn
        team2Label.isHidden = isPlaying &&  isTeam1Turn
    }
    
    @IBAction func wrongAnswerTap() {
        populateNewQuote()
    }
    
    @IBAction func rightAnswerTap(_ sender: Any) {
        populateNewQuote()
        if isTeam1Turn {
            team1Stepper.value += 1
            team1SteperTap(team1Stepper)
        }
        else {
            team2Stepper.value += 1
            team2SteperTap(team2Stepper)
        }
    }
    
    @IBAction func startTeam1Timer() {
        isTeam1Turn = true
        startGame()
    }
    
    @IBAction func startTeam2Timer() {
       isTeam1Turn = false
        startGame()
    }
    
    func startGame() {
        populateNewQuote()
       updateGameUI(isPlaying: true)
        timerCount = 30
        self.timerLabel.text = "\(self.timerCount)"
        timerCancelable?.cancel()
        self.timerCancelable =  Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .receive(on: RunLoop.main)
            .sink { (_) in
                if self.timerCount > 0  {
                    self.timerCount -= 1
                    self.timerLabel.text = "\(self.timerCount)"
                } else {
                    self.endGame()
                }
            }
    }
    
    @IBAction func team1SteperTap(_ sender: UIStepper) {
        team1Score.text = "\(Int(sender.value))"
    }
    
    @IBAction func team2SteperTap(_ sender: UIStepper) {
        team2Score.text = "\(Int(sender.value))"
    }
    
    func endGame() {
        self.timerCancelable?.cancel()
        self.updateGameUI(isPlaying: false)
    }
    
    
    
    
    
}
