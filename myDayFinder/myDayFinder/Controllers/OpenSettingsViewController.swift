//
//  OpenSettingsViewController.swift
//  myDayFinder
//
//  Created by toms.siemaskevics on 14/04/2023.
//

import UIKit

class OpenSettingsViewController: UIViewController {
    
    @IBOutlet weak var changeThemeTapped: UIButton!
    
    @IBAction func openSettingsTapped(_ sender: UIButton) {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:],completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func xButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func changeThemeTapped(_ sender: Any) {
        if #available(iOS 13.0, *){
            if self.traitCollection.userInterfaceStyle == .dark {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                    changeThemeTapped.setTitle("Change To Dark Theme", for: .normal)
                }
            } else{
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                    changeThemeTapped.setTitle("Change To Light Theme", for: .normal)
                }
            }
        }
        
        
    }
}
