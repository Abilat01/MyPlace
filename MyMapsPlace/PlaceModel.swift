//
//  PlaceModel.swift
//  MyMapsPlace
//
//  Created by Danya on 02.06.2021.
//

import RealmSwift

class Place: Object {
    
    @objc var name = ""
    @objc var location: String?
    @objc var type: String?
    @objc var imageData: Data?
    
}
