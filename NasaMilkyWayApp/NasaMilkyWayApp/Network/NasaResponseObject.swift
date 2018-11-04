//
//  NasaResponseObject.swift
//  NasaMilkyWayApp
//
//  Created by Emese Toth on 04/11/2018.
//  Copyright © 2018 Emese Toth. All rights reserved.
//

import Foundation

struct NASAJsonObject : Decodable {
    let collection : NASACollection?
}

struct NASACollection : Decodable {
    let href : String?
    let items : [NASAItems?]
    let metadata : MetaData?
    let version : String?
}

struct MetaData : Decodable {
    let total_hits : Double?
}

struct NASAItems : Decodable {
    let href : String?
    let links : [NASALinks?]
    let data : [NASAData?]
}

struct NASALinks : Decodable {
    let href : String?
    let render : String?
    let rel : String?
}

struct NASAData : Decodable {
    let album : String?
    let center : String?
    let date_created : String?
    let description : String?
    let keywords : [String]
    let location : String?
    let media_type : String?
    let nasa_id : String?
    let title : String?
}
