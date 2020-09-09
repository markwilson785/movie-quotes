//
//  movieQuotesController.swift
//  movieQuotes
//
//  Created by Mark Wilson on 8/26/20.
//  Copyright © 2020 Mark Wilson. All rights reserved.
//

import Foundation
struct MovieQuotesController {
    static var singleton = MovieQuotesController()

    var quotes: [MovieQuote]

    func getRandomQuote() -> MovieQuote{
        let randomInt = Int.random(in: 0..<quotes.count)
       return quotes[randomInt]
        
    }
    
    init(){
        let path = Bundle.main.path(forResource: "moviesQuotes", ofType: "json")!
        let pathURL = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: pathURL)
            self.quotes = try JSONDecoder().decode([MovieQuote].self, from:data)
        }
        catch{
            print(error)
            fatalError()
        }
    }
    
}

