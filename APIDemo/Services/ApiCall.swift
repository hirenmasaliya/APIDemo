//
//  ApiCall.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 19/09/24.
//

import Foundation
import Alamofire

func callJokeAPI(completionHandler: @escaping(Result<[JokeModel], Error>) -> Void){
    let urlstr = "https://official-joke-api.appspot.com/jokes/random/25"
    AF.request(urlstr).responseDecodable(of: [JokeModel].self) { response in
        
        switch response.result {
            
        case .success(let data):
//            debugPrint("data fetched : \(data)")
            completionHandler(.success(data))
            
        case .failure(let error):
//            debugPrint("something went wrong: \(error)")
            completionHandler(.failure(error))
        }
    }
}
