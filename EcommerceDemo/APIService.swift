//
//  APIService.swift
//  EcommerceDemo
//
//  Created by NItesh on 10/03/18.
//  Copyright © 2018 NItesh. All rights reserved.
//

import Foundation
class APIService: NSObject {
    
    lazy var endPoint: String = {
        return "https://stark-spire-93433.herokuapp.com/json"
//        return ""
    }()
    
    func getDataWith(completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        
        let urlString = endPoint
        
        guard let url = URL(string: urlString) else { return completion(.Error("Invalid URL, we can't update your feed")) }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
//                    guard let itemsJsonArray = json["categories"] as? [String: AnyObject] else {
                    guard let itemsJsonArray = json as? [String: AnyObject] else {
                        return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }
}

enum Result <T>{
    case Success(T)
    case Error(String)
}
