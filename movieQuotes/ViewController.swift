//
//  ViewController.swift
//  movieQuotes
//
//  Created by Mark Wilson on 7/28/20.
//  Copyright © 2020 Mark Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayQouteLabel: UILabel!
     @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateNewQuote()
    }
   
    func populateNewQuote() {
        let movieQuote = MovieQuotesController.singleton.getRandomQuote()
        displayQouteLabel.text = movieQuote.text
        characterNameLabel.text = movieQuote.characterName
        movieTitleLabel.text = movieQuote.movieTitle
        
    }

    @IBAction func newQuoteAction(_ sender: Any) {
       
       populateNewQuote()
    }
}


