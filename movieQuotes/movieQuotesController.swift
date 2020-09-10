//
//  movieQuotesController.swift
//  movieQuotes
//
//  Created by Mark Wilson on 8/26/20.
//  Copyright © 2020 Mark Wilson. All rights reserved.
//

import Foundation
class MovieQuotesController {
    static var singleton = MovieQuotesController()
    
    var allQuotes: [MovieQuote]
    var availableQutoes: [MovieQuote]
    
    func getRandomQuote() -> MovieQuote{
        if availableQutoes.count == 0 {
            resetAvailableQuotes()
        }
        let randomInt = Int.random(in: 0..<availableQutoes.count)
        let randomQuote = availableQutoes[randomInt]
        availableQutoes.remove(at: randomInt)
        return randomQuote
    }
    
    init(){
        let path = Bundle.main.path(forResource: "moviesQuotes", ofType: "json")!
        let pathURL = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: pathURL)
            self.allQuotes = try JSONDecoder().decode([MovieQuote].self, from:data)
            availableQutoes = allQuotes 
            
        }
        catch{
            print(error)
            fatalError()
        }
    }
    func resetAvailableQuotes() {
        availableQutoes = allQuotes
        
    }
}

