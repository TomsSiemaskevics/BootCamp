//
//  ViewController.swift
//  myDayFinder
//
//  Created by toms.siemaskevics on 14/04/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var dayShow: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dayTextField.delegate = self
        monthTextField.delegate = self
        yearTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let myDay = Int(dayTextField.text ?? ""), let myMonth = Int(monthTextField.text ?? ""), let myYear = Int(yearTextField.text ?? "")
        else{
            basicAlert(title: "Error", message: "Fields can not be empty")
            return
        }
        dateComponents.day = myDay
        dateComponents.month = myMonth
        dateComponents.year = myYear
        guard let myDate = calendar.date(from: dateComponents) else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEE"
        
        switch searchButton.titleLabel?.text{
        case "Search":
            searchButton.setTitle("Foud!", for: .normal)
            if myDay >= 1 && myDay < 31 && myMonth >= 1 && myMonth <= 12{
                
                
                let weekday = dateFormatter.string(from: myDate)
                dayShow.text = weekday.capitalized
            } else {
                basicAlert(title: "Wrong values", message: "Please check for correct values")
                clearMyTextFields()
            }
        default:
            searchButton.setTitle("Search", for: .normal)
            clearMyTextFields()
            
        }
    }
    func clearMyTextFields(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        dayShow.text = "Day"
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func basicAlert(title: String?, message: String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

