//
//  RYJLikeViewController.swift
//  mall
//
//  Created by fangyuan ding on 2021/5/27.
//

import UIKit

class RYJLikeViewController: RYJBaseViewController {
    
    var weatherData : weather? = nil
    var lifeData : life? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Like"

       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        getWeatherData()
        getLifeData()
        
    }
    func getWeatherData(){
        RYJShopProvider.request(.weather){ [self] result in
            if case let .success(response) = result{
                //解析数据
                let jsonString = String(data: response.data, encoding: .utf8)
                weatherData = weather.deserialize(from: jsonString, designatedPath: "result")
            }
            
        }
    }
    func getLifeData(){
        RYJShopProvider.request(.life){ [self] result in
            if case let .success(response) = result{
                //解析数据
                let jsonString = String(data: response.data, encoding: .utf8)
                lifeData = life.deserialize(from: jsonString, designatedPath: "result.life")
            }
            
        }
    }
    


}
