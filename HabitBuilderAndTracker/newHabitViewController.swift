//
//  newHabitViewController.swift
//  HabitBuilderAndTracker
//
//  Created by Woulfe, Edmond   (woulf002) on 5/7/19.
//  Copyright © 2019 akhil. All rights reserved.
//

import UIKit

class newHabitViewController: UIViewController{
    public var parentView: DayViewController!
    var monday = false;
    var tuesday = false;
    var wednesday = false;
    var thursday = false;
    var friday = false;
    var saturday = false;
    var sunday = false;
    public var update: ((String, Bool, Bool, Bool, Bool, Bool, Bool, Bool) ->())!
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {});
        self.navigationController?.popViewController(animated: true);
    }
    @IBOutlet weak var habitNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func mondayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            monday = false
        }else{
            sender.isSelected = true
            monday = true
        }
    }
    
    @IBAction func tuesdayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            tuesday = false
        }else{
            sender.isSelected = true
            tuesday = true
        }
    }
    
    
    @IBAction func wednesdayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            wednesday = false
        }else{
            sender.isSelected = true
            wednesday = true
        }
    }
    
    @IBAction func thursdayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            thursday = false
        }else{
            sender.isSelected = true
            thursday = true
        }
    }
    
    
    @IBAction func fridayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            friday = false
        }else{
            sender.isSelected = true
            friday = true
        }
    }
    @IBAction func saturdayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            saturday = false
        }else{
            sender.isSelected = true
            saturday = true
        }
    }
    
    @IBAction func sundayButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sunday = false
        }else{
            sender.isSelected = true
            sunday = true
        }
    }
    
   
    
    @IBAction func habitButtonPressed(_ sender: UIButton) {
        update(habitNameTextField.text ?? "", monday, tuesday, wednesday, thursday, friday, saturday, sunday)
        self.dismiss(animated: true, completion: {});
        self.navigationController?.popViewController(animated: true);
    }
    
}
