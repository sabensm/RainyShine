//
//  Constants.swift
//  RainyShine
//
//  Created by Mike Sabens on 10/25/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import Foundation

//URL for API to Hit for Current Weather

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "cf3465f7927a3763f8325dc93c77e36a"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

//Additions to URL for API to Hit for Current Weather

let BASE_FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let DAY_COUNT = "&cnt="

let CURRENT_FORECAST_URL = "\(BASE_FORECAST_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(DAY_COUNT)11\(APP_ID)\(API_KEY)"

//This is going to tell our function when we are finished downloading

typealias DownloadComplete = () -> ()

