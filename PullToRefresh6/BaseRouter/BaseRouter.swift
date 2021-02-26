//
//  BaseRouter.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

enum HTTPMethod {
    case get
    case post
    case put
    
    var value: String {
        get {
            switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
            case .put:
                return "PUT"
            }
        }
    }
}

class BaseRouter {
    static let shared: BaseRouter = BaseRouter()
    
    func getData<T: Codable>(urlString: String, params: [URLQueryItem]? = nil, method: HTTPMethod, completion: @escaping(T)->()) {
        var urlBuilder = URLComponents(string: urlString)
        urlBuilder?.queryItems = params
        
        guard let url = urlBuilder?.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.value
        urlRequest.cachePolicy = .useProtocolCachePolicy
        urlRequest.timeoutInterval = 30.0
        //        urlRequest.setValue("value", forHTTPHeaderField: "key")
        let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("fullURLRequest: ", url)
                print("params: ", url.query)
                print("header: ", url.absoluteURL)
                print("Response json:\n")
                data.printJSON()
            }
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(data)
                }
            } catch let error {
                print("decode error: ", error)
            }
        })
        dataTask.resume()
    }
}
