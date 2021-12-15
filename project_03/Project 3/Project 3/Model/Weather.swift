//
//  WeatherManager.swift
//  Project 3
//
//  Created by Tia Petts on 11/11/21.
//

import Foundation
import UIKit

class Weather : CustomStringConvertible, Codable {
    
    var windSpeed: String
    var temperature: String
    var windDirection: Int
    var clouds: String
    //lazy var windImage: UIImage = UIImage()
    
    var description: String {
        return "Wind Speed: \(self.windSpeed)\nTemperature: \(self.temperature)\nWind Direction: \(self.windDirection)"
    }
    
    init(windSpeed: String, temp: String, windDirection: Int, clouds: String) {
        self.windSpeed = windSpeed
        self.temperature = temp
        self.windDirection = windDirection
        self.clouds = clouds
        
        
//        let image: UIImage = UIImage(named: "partlyCloudy")
    }
    
    required init(from decoder: Decoder) throws {
        // step 2 of re-mapping the data of the key value pairs
        let valueContainer = try decoder.container(keyedBy: WeatherKeys.self)
        self.windSpeed = try valueContainer.decode(String.self, forKey: .windSpeed)
        self.temperature = try valueContainer.decode(String.self, forKey: .temperature)
        self.windDirection = try valueContainer.decode(Int.self, forKey: .windDirection)
        self.clouds = try valueContainer.decode(String.self, forKey: .clouds)
    }
    
    enum WeatherKeys: String, CodingKey {
        // step 1 of re-mapping data of the key value pairs
        case windSpeed = "windSpeed"
        case temperature = "temperature"
        case windDirection = "windDirection"
        case clouds = "clouds"
    }


    
}
