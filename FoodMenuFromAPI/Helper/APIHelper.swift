//
//  APIHelper.swift
//  FoodMenuFromAPI
//
//  Created by Shivam Patel on 22/05/22.
//

import Foundation
import UIKit

class APIHelper{
    
    static let shareInstance = APIHelper()
    
    func getFoodItemsFromAPI(baseURL:String,completionHandler: @escaping ([FoodModel]) -> ()){
        guard let url = URL(string: baseURL) else { return }
        
        let header:[String:String] = [
            
            "Session": "fb4e7f9b-0f31-4709-",
            "Content-Type": "X-Requested-With",
            "X-Requested-With": "XMLHttpRequest"
        ]
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let jsonResponse = try JSONDecoder().decode(Result.self, from: data)
                if let categories = jsonResponse.categories as? [Category],categories.count > 0 {
                    completionHandler(categories[0].products)
                }
            } catch  {
                print(error)
            }
        }.resume()
    }
    
    
}

