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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "moviesQuotes", ofType: "json")!
        let pathURL = URL(fileURLWithPath: path)
        
        
        
        do{
            let data = try Data(contentsOf: pathURL)
            let quotes = try JSONDecoder().decode([MovieQuote].self, from:data)
            print(quotes)
        }
        catch{
            print(error)
        }
    }


    @IBAction func newQuoteAction(_ sender: Any) {
    }
}


