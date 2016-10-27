//
//  WeatherCell.swift
//  RainyShine
//
//  Created by Mike Sabens on 10/25/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        //setup the iboutlets to pull data from an instance of forecast
        lowTempLabel.text = "\(forecast.lowTemp)"
        highTempLabel.text = "\(forecast.highTemp)"
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }
    
    
}
