//
//  ViewController.swift
//  TrafficLight
//
//  Created by Denis Bokov on 26.02.2024.
//

import UIKit

class MainViewController: UIViewController {

   
    @IBOutlet var redColorTrafficLigth: UIView!
    
    @IBOutlet var yellowColorTrafficLigth: UIView!
    
    @IBOutlet var greenColorTrafficLigth: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private let turnedOff: CGFloat = 0.3
    private let turnedOn: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupColorTarafficsLigth(for: [redColorTrafficLigth, greenColorTrafficLigth, yellowColorTrafficLigth])
        
        startButton.layer.cornerRadius = 10
 
    }
    
    
    @IBAction func startingTrafficLigth(_ sender: Any) {
        
        startButton.setTitle("NEXT", for: .normal)
        
        if redColorTrafficLigth.alpha == yellowColorTrafficLigth.alpha {
            redColorTrafficLigth.alpha = turnedOn
            greenColorTrafficLigth.alpha = turnedOff
        } else if redColorTrafficLigth.alpha > turnedOff && yellowColorTrafficLigth.alpha == greenColorTrafficLigth.alpha {
            yellowColorTrafficLigth.alpha = turnedOn
            redColorTrafficLigth.alpha = turnedOff
        } else if yellowColorTrafficLigth.alpha > turnedOff && greenColorTrafficLigth.alpha == redColorTrafficLigth.alpha {
            yellowColorTrafficLigth.alpha = turnedOff
            greenColorTrafficLigth.alpha = turnedOn
        }
        
    }
    
    private func setupColorTarafficsLigth(for colors: [UIView]) {
        for color in colors {
            if color == redColorTrafficLigth {
                redColorTrafficLigth.backgroundColor = .red
                redColorTrafficLigth.alpha = turnedOff
                redColorTrafficLigth.layer.cornerRadius = redColorTrafficLigth.frame.height / 2
            } else if color == yellowColorTrafficLigth {
                yellowColorTrafficLigth.backgroundColor = .yellow
                yellowColorTrafficLigth.alpha = turnedOff
                yellowColorTrafficLigth.layer.cornerRadius = yellowColorTrafficLigth.frame.height / 2
            } else {
                greenColorTrafficLigth.backgroundColor = .green
                greenColorTrafficLigth.alpha = turnedOff
                greenColorTrafficLigth.layer.cornerRadius = greenColorTrafficLigth.frame.height / 2
            }
        }
    }
    
}

