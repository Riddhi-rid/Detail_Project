//
//  ApiManager.swift
//  PracticeTable
//
//  Created by admin on 04/10/24.
//

import Foundation
import Alamofire


class ApiManager {
    
    let url="https://official-joke-api.appspot.com/jokes/random/50"
    
    func ApiCall(Mydata: @escaping(Result< [JokeModel], Error >) -> Void){
        
        AF.request(url).responseDecodable(of: [JokeModel].self) { res in
            switch res.result {
            case .success(let data):
                Mydata(.success(data))
            case .failure(let err):
                Mydata(.failure(err))
            }
            }
            
        }
    }


struct JokeModel: Codable{
    
    let id:Int
    let type:String
    let setup:String
    let punchline:String
}
