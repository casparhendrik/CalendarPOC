//
//  HomepageViewController.swift
//  CalendarApp
//
//  Created by Caspar van Boom on 01/12/2019.
//  Copyright © 2019 Caspar van Boom. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {
        
    @IBOutlet weak var stepsPercentage: UILabel!
    @IBOutlet weak var stepsCount: UILabel!
    @IBOutlet weak var stepsGoal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupStepsSection()
        
    }
    
    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Calendar", style: .done, target: self, action: #selector(goToCalendarPage))
    }
    
    func setupStepsSection() {
        let stepsGoal = 10000.0
        let stepsCount = 9101.0
        let stepsPercentage = (stepsCount / stepsGoal) * 100
        
        self.stepsPercentage!.text = "\(stepsPercentage)" + "%"
        self.stepsCount!.text = "\(stepsCount)"
        self.stepsGoal!.text = "/" + "\(stepsGoal)" + " steps"
        
    }
    
    @objc func goToCalendarPage() {
        performSegue(withIdentifier: "calendarsegue", sender: self)
    }
    
//    @IBAction func breakButton(_ sender: UIButton) {
//        if breakButton.titleLabel!.text == "Ik neem nu pauze" {
//            sendBreakAlertToUser(onABreak: true)
//            breakButton.setTitle("Ik stop nu met pauze nemen", for: .normal)
//        } else {
//            sendBreakAlertToUser(onABreak: false)
//            breakButton.setTitle("Ik neem nu pauze", for: .normal)
//        }
//    }
//
//    private func sendBreakAlertToUser(onABreak: Bool) {
//        var title: String?
//        var message: String?
//
//        if onABreak {
//            title = "Goedzo!"
//            message = "Je kan nu pauze nemen!"
//        } else {
//            title = "Succes!"
//            message = "Je kan nu verder met werk"
//        }
//
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Oke!", style: .default, handler: nil))
//
//        self.present(alert, animated: true)
//    }
    
}
