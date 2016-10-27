//
//  Location.swift
//  RainyShine
//
//  Created by Mike Sabens on 10/26/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
