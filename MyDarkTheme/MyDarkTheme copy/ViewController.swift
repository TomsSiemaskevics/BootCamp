//
//  ViewController.swift
//  MyDarkTheme
//
//  Created by toms.siemaskevics on 04/04/2023.
//

import UIKit

class ViewController: UIViewController {
    var darkIsOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
    }
    
    
    @IBAction func darkModePressed(_ sender: Any) {
        darkIsOn = !darkIsOn
        if darkIsOn {
            darkThemeIsOn(isOn: darkIsOn)
            let button = (sender as AnyObject)
               button.setTitle("Dark Mode Off", for: .normal)
            
        }
        else {
            darkIsOff(isOn: darkIsOn)
            let button = (sender as AnyObject)
               button.setTitle("Dark Mode On", for: .normal)
        }
        
        
    }
    func darkThemeIsOn(isOn: Bool){
        navigationItem.title = "Dark Mode On"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        view.backgroundColor = UIColor.black
    }
    func darkIsOff(isOn: Bool){
        navigationItem.title = "Dark Mode Off"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        
        view.backgroundColor = UIColor.white
    }
}
    

