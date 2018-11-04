//
//  NetworkManager.swift
//  NasaMilkyWayApp
//
//  Created by Emese Toth on 04/11/2018.
//  Copyright © 2018 Emese Toth. All rights reserved.
//

import Foundation
import Alamofire

struct MilkyWayData {
    let title : String
    let center : String
    let date : String
    let description : String
    let imageUrl : String
}

enum HTTPError: Error {
    case badRequest
    case notFound
    case serverError
}

class NetworkManager {
    
    let urlString = "https://images-api.nasa.gov/search?q=milky%20way&media_type=image&year_start=2017&year_end=2017"
    
    func getResponse(completion: @escaping ([MilkyWayData]?, Error?) -> Void){
        Alamofire.request(urlString).responseJSON { response in
            if let status = response.response?.statusCode {
                if status == 200 {
                    if let data = response.data {
                        do {
                            let Ndata = try JSONDecoder().decode(NASAJsonObject.self, from: data)
                            let milkyWayArray = self.parseResponse(Ndata)
                            completion(milkyWayArray, nil)
                        } catch let jsonErr {
                            completion(nil, jsonErr)
                        }
                    }
                } else {
                    switch status {
                    case 400 :
                        completion(nil, HTTPError.badRequest)
                    case 404 :
                        completion(nil, HTTPError.notFound)
                    default:
                        completion(nil, HTTPError.serverError)
                    }
                }
            }
            
        }
    }
    
    func parseResponse(_ nasa_data: NASAJsonObject) -> [MilkyWayData] {
        var milkyWayArray = [MilkyWayData]()
        for item in nasa_data.collection!.items {
            for link in item!.links {
                let title = item!.data[0]!.title!
                let center = item!.data[0]!.center!
                let created = item!.data[0]!.date_created!
                let desc = item!.data[0]!.description!
                let url = link?.href
                milkyWayArray.append(MilkyWayData(title: title, center: center, date: created, description: desc, imageUrl: url!))
            }
        }
        return milkyWayArray
    }
}
