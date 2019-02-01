//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue : Double = 0

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBAction func resetButtonTapped(_ sender: Any) {
        if resetButton.title == "" {
            return
        } else {
            imageView.image = #imageLiteral(resourceName: "Locked")
        }
    }
    @IBAction func updateSlider(_ sliderControl: LockSlider) {
        if sliderValue < 0.80 {
            resetButton.title = ""
            return
        }
        else {
            resetButton.title = "Reset"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 25
        resetButton.title = ""
        imageView.image = #imageLiteral(resourceName: "Locked")
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setTypeAppearance()
        self.navigationItem.title = "Hello!"
        navigationController?.navigationBar.barTintColor = .red
    }

     func setTypeAppearance(){
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    
    }

}

