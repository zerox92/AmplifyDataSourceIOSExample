//
//  ViewController.swift
//  AmplifyFrameworkDataStore
//
//  Created by Anjum, Zeeshan on 15/02/2022.
//

import UIKit
import Amplify

class ViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Added instructions for usage
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        self.nameTF.resignFirstResponder()
        self.descriptionTF.resignFirstResponder()
        let profile = Profile.init(name: nameTF.text ?? "", description: descriptionTF.text ?? "");

        Amplify.DataStore.save(profile) { result in
            switch result {
            case .success:
                print("Profile saved successfully!")
                self.nameTF.text = ""
                self.descriptionTF.text = ""
            case .failure(let error):
                print("Error saving post \(error)")
            }
        }
    }
    
}

