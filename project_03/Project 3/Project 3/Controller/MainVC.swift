//
//  MainVC.swift
//  Project 3
//
//  Created by Tia Petts on 4/7/21.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var zipCode: UITextField!
    
    var location: Location? = nil
    var weather: Weather? = nil {
        didSet {
            DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DisplayWeathVC") as! DisplayWeathVC
                vc.weather = self.weather
                vc.location = self.location
                self.present(vc, animated: true)
        }
    }
}

    // Called when your screen's view loads (right before it shows on screen)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Setup code
//        location = Location.placeName(self)
//        
        //temperature.self = 
//        
//        UIView.animate(withDuration: 1.5) {
//            self.windImage.transform =
//                CGAffineTransform(translationX: 100.0, y: 100.0)
//        }
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    @IBAction func searchTouched(_ sender: Any) {
        
        // Location information api call...
        guard let zipcode = zipCode.text else { return }
        
        LocationManager.fetchLocation(from: zipcode, completion: { data, response, error in
            // This runs when the fetching process completes. The api will provide the data, response, and error (if there is one).
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let locationInfo: [String: [Location]] = try jsonDecoder.decode([String: [Location]].self, from: data)
                let postalCodeLocations: [Location] = locationInfo["postalCodes"] ?? []
                let firstPostalCodeLocation: Location = postalCodeLocations[0]
                self.location = firstPostalCodeLocation
                print(firstPostalCodeLocation.latitude)
                print(firstPostalCodeLocation.longitude)
                
                // Now continuing with the weather api call...
                LocationManager.fetchWeather(from: firstPostalCodeLocation.latitude, lng: firstPostalCodeLocation.longitude, completion: { data, response, error in
                    
                    guard let weatherData = data else { return }
                    
                    let jsonDecoder = JSONDecoder()
                    do{
                        let weatherInfo = try jsonDecoder.decode([String: Weather].self, from: weatherData)
                        let weather = weatherInfo["weatherObservation"]!
                        print(weather.description)
                        self.weather = weather
                        
                        

                    }
                    catch {
                        print(error)
                    }
                })
            }
            catch {
                print(error)
                return
            }
        })
    }
    
    // Use this method to transfer data during a transition from one vc to another.
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let displayWeatherVC = segue.destination as? DisplayWeathVC {
//            displayWeatherVC.location = self.location
//            displayWeatherVC.weather = self.weather
//        }
        
//       let displayWeatherVC = segue.destination as! DisplayWeathVC
//        displayWeatherVC.location = self.location
        
    }

