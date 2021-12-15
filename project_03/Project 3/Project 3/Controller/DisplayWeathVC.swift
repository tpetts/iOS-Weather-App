//
//  DisplayWeathVC.swift
//  Project 3
//
//  Created by Tia Petts on 12/10/21.
//

import UIKit

class DisplayWeathVC: UIViewController {

    @IBOutlet weak var windImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var location: Location!
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //if statement to figure out cloud image value
        
        //windImageView!.image = weather.windImage
        let celsius: Float = Float(weather?.temperature ?? "90") ?? 90
        let fahrenheit: Float = celsius * 1.8 + 32
        let fahrenheitString: String = String(fahrenheit)
        tempLabel.text = fahrenheitString + " degrees"
        
        windSpeedLabel.text = weather.windSpeed + " mph"
        windDirectionLabel.text = String(weather.windDirection) + " degrees"
        
        latitudeLabel.text = String(location?.latitude ?? 0.0)
        longitudeLabel.text = String(location?.longitude ?? 0.0)
    }

}
