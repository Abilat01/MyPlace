//
//  PlaceModel.swift
//  MyMapsPlace
//
//  Created by Danya on 02.06.2021.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var image: String
    
    static let restaurantNames = ["Бар пробка", "Васаби", "Додо пицца", "Евразия", "Жемчужина",
                               "Камелот", "Карл Швабе", "Много мяса", "Пивная кружка",
                               "СушиWay", "Теремок", "Beerloga", "SPB", "TOKIO-SITI"]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Колпино", type: "Ресторан", image: place))
        }
        return places
    }
    
}
