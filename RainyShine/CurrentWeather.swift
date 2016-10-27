//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by Mike Sabens on 10/25/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    //data encapsulation
    
    var cityName: String! {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        //create an instance of date formatter and give it a date style and time style
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        //create constant and return the proper date
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    //create function 
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        //iniatlaize the URL to tell alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        
        //start alamo fire
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            
            //what is the result?
            
            let result = response.result
            
                //add downloaded data into the variables! 
            
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    
                    //traversing through the returned dictionary in the API and setting the values for our variables accordingly. 
                    
                    if let name = dict["name"] as? String {
                        self._cityName = name.capitalized
                        print (self._cityName)
                    }
                    
                    if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                        
                        if let main = weather[0]["main"] as? String {
                            self._weatherType = main.capitalized
                            print (self._weatherType)
                        }
                    }
                    
                    // This varialbe main is different from the above. In the case of this API "main" is a key that is reused
                    // It's used as a key in both weather.main as well as main. 
                    // We're just naming the variables the keys, so that's why main appears twice. 
                    
                    // The temperate is returned in Kelvin. So we have a whole formula that converts it to F.
                    
                    if let main = dict["main"] as? Dictionary<String, AnyObject> {
                        if let currentTemperature = main["temp"] as? Double {
                             let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                             let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                            
                            self._currentTemp = kelvinToFarenheit
                            print (self._currentTemp)
                            
                            }
                        }
                    }
            completed()
                
        }
        

    }

    }
