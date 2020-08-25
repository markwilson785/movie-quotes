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
        guard let path = Bundle.main.path(forResource: "movieQuotes", ofType: "json"), let pathURL = URL(string: path), let data = try? Data(contentsOf: pathURL) else
        {
           print(Bundle.main.path(forResource: "movieQuotes", ofType: "json"))
            return}
        do{
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


