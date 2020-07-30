//
//  ViewController.swift
//  Questionnarie
//
//  Created by Тимур Табынбаев on 7/30/20.
//  Copyright © 2020 Тимур Табынбаев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var birthdatePicker: UIDatePicker!
    @IBOutlet var workTextField: UITextField!
    @IBOutlet var salarySlider: UISlider!
    @IBOutlet var salaryLabel: UILabel!
    @IBOutlet var straightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func salarySliderDidChangeValue() {
        salaryLabel.text = "$\(Int(salarySlider.value))K"
    }
    
    @IBAction func saveButtonDidTap() {
        let name = nameTextField.text ?? ""
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender = genderSegmentedControl.titleForSegment(at: genderIndex) ?? ""
        let birthdate = birthdatePicker.date
        let work = workTextField.text ?? ""
        let salary = salaryLabel.text ?? ""
        let isStraight = straightSwitch.isOn
        
        let now = Date()
        let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: now)
        let age = ageComponents.year!
        
        var interestedIn = "Men"
        if (gender == "Male" && isStraight) || (gender == "Female" && !isStraight) {
            interestedIn = "Women"
        }
        
        let title = "My personal Info"
        let message = "Hi, I am \(name). As a \(age)-year-old \(work) earning \(salary), I am interested in \(interestedIn)"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true, completion: nil)
    }
}

