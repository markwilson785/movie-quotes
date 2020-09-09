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
    
    @IBOutlet weak var displayTimer: UILabel!
   
    @IBAction func startTimerButton(_ sender: Any) {
        timerCount = 30
        self.displayTimer.text = "\(self.timerCount)"
        timerCancelable?.cancel()
        self.timerCancelable =  Timer.publish(every: 1, on:
            .main, in: .default)
        .autoconnect()
            .receive(on:
                RunLoop.main)
            .sink { (_) in
                guard self.timerCount > 0 else {
                    self.timerCancelable?.cancel()
                    return 
                }
                self.timerCount -= 1
                self.displayTimer.text = "\(self.timerCount)"
                
                
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
