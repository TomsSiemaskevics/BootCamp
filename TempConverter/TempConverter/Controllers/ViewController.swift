//
//  ViewController.swift
//  TempConverter
//
//  Created by toms.siemaskevics on 17/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kelvinLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahreinheitLabel: UILabel!
    @IBOutlet weak var valueBubble: UILabel!
    @IBAction func tempSliderChanged(_ sender: UISlider) {
        let celsius = sender.value
        let kelvin = celsius + 273.15
        let fahrenheit = celsius * 1.8 + 32
        fahreinheitLabel.text = String(format: "%.0F°F", fahrenheit)
        celsiusLabel.text = String(format: "%.0F°C", celsius)
        kelvinLabel.text = String(format: "%.0F°K", kelvin)
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //add value bubble to slider
        let slider = UISlider()
        slider.addSubview(valueBubble)
        valueBubble.isHidden = true
        //round the corners
        valueBubble.layer.cornerRadius = valueBubble.frame.height / 2
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderTouchUp(_:)), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderTouchUp(_:)), for: .touchUpOutside)
    }
    //show bubble when slider iss touched
    @objc func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        let bubbleWidth: CGFloat = 40 // size to fit text
        let bubbleHeight: CGFloat = 30 // size to fit text
        let xPos = sender.frame.origin.x + (CGFloat(currentValue) + 50) / 100 * sender.frame.width - bubbleWidth / 2
        let yPos = sender.frame.origin.y - bubbleHeight - 10 // adjust position above slider
        valueBubble.frame = CGRect(x: xPos, y: yPos, width: bubbleWidth, height: bubbleHeight)
        valueBubble.isHidden = false
        valueBubble.text = "\(currentValue)"
    }
    //hide bubble when slidere not  touched
    @objc func sliderTouchUp(_ sender: UISlider){
        valueBubble.isHidden = true
        
    }
    
}

