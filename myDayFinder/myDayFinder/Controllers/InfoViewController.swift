//
//  InfoViewController.swift
//  myDayFinder
//
//  Created by toms.siemaskevics on 14/04/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var developerInfo: UILabel!
    @IBOutlet weak var versionInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            versionInfo.text = "Version \(version)"
        }
        if let bundleIdenntifier = Bundle.main.bundleIdentifier {
            let developerName = bundleIdenntifier.components(separatedBy: ".").first ?? "Unknown Developer"
            developerInfo.text = "Developer: \(developerName)"
            
        } else {
            developerInfo.text = "Unknown Developer"
        }
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
