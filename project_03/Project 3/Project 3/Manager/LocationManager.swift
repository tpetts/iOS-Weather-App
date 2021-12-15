//
//  LocationManager.swift
//  Project 3
//
//  Created by Tia Petts on 4/7/21.
//

import Foundation

class LocationManager {
    
    /// Fetches the latitude and longitude from the remote API based on the provided zipcode.
    /// - Parameters:
    ///   - zipcode: The zip code to fetch lat./long. info for.
    ///   - completion: The block of code to call when the fetching process completes. It will contain the `Data`, `URLResponse`, and an `Error` if there is one.
    static func fetchLocation(from zipcode: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    
        guard let locationURL = URL(string: "http://api.geonames.org/postalCodeSearchJSON?username=tpetts&postalcode=\(zipcode)&country=US")
        else {
            return
        }
        let locationTask = URLSession.shared.dataTask(with: locationURL, completionHandler: completion)
        locationTask.resume()
    }
    
    
    /// Fetches nearby weather from geonames api based on the latitude and longitude
    /// - Parameters:
    ///   - lat: latitude to find weather
    ///   - lng: longitude to find weather
    ///   - completion: a block of code to execute/run when the fetching process completes. It is provided with the data url response
    static func fetchWeather(from lat: Double, lng: Double, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let weatherURL = URL(string: "http://api.geonames.org/findNearByWeatherJSON?formatted=true&username=tpetts&lat=\(lat)&lng=\(lng)")
        else
        {
            return
        }
        
        let weatherTask = URLSession.shared.dataTask(with: weatherURL, completionHandler: completion)
        weatherTask.resume()
    }
}

