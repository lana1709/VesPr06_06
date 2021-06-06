//
//  MovieObject.swift
//  FirstApp
//
//  Created by luser on 06.06.2021.
//
//Просмотр фильмов
import Foundation
import Alamofire
import SwiftyJSON

class MovieObject: ObservableObject {
    @Published var posters = [String]()
    func getMovies() {
        let url = "http://cinema.areas.su/movies"
        let parameters : [String: String] = [
            "filter" : "new"
        ]
        AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for index in 0..<json.count {
                    self.posters.append(json[index]["poster"].stringValue)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
