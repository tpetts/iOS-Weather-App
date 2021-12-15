//
//  Location.swift
//  Project 3
//
//  Created by Tia Petts on 4/7/21.
//

import Foundation

class Location: CustomStringConvertible, Codable {
    
    var latitude: Double
    var longitude: Double
    var placeName: String
    var state: String
    
    var description: String {
        return "latitude: \(self.latitude)\nlongitude: \(self.longitude)\nCommon Name: \(self.placeName)\nState: \(self.state)"
    }
    
    init(lat: Double, lng: Double, placeName: String, state: String) {
        self.latitude = lat
        self.longitude = lng
        self.placeName = placeName
        self.state = state
    }
    
    required init(from decoder: Decoder) throws {
        // step 2 of re-mapping the data of the key value pairs
        let valueContainer = try decoder.container(keyedBy: LocationKeys.self)
        self.latitude = try valueContainer.decode(Double.self, forKey: .latitude)
        self.longitude = try valueContainer.decode(Double.self, forKey: .longitude)
        self.placeName = try valueContainer.decode(String.self, forKey: .placeName)
        self.state = try valueContainer.decode(String.self, forKey: .state)
    }
    
    enum LocationKeys: String, CodingKey {
        // step 1 of re-mapping data of the key value pairs
        case latitude = "lat"
        case longitude = "lng"
        case placeName = "placeName"
        case state = "adminName1"
    }
}
