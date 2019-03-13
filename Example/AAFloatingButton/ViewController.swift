//
//  ViewController.swift
//  AAFloatingButton
//
//  Created by engrahsanali on 06/28/2018.
//  Copyright (c) 2018 engrahsanali. All rights reserved.
//

import UIKit
import AAFloatingButton

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var nibButton: AAFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fab = self.view.aa_addFloatingButton("A", .black, size: 80, bottomMargin: 40) {
            print("Clicked Added Button")
        }
        print(fab)
        
        nibButton.onClick {
            print("Clicked Nib Button")
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

