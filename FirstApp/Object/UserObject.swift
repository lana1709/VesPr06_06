//
//  UserObject.swift
//  FirstApp
//
//  Created by luser on 05.06.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserObject: ObservableObject {
    
    func login(email: String, password: String) {
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]
        let url = "http://cinema.areas.su/auth/login"
        AF.request(url, method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                    print("JSON: \(json)")
                   
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
