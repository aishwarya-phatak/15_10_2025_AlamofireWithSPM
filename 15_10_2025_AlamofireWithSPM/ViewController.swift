//
//  ViewController.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 15/01/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var url : URL?
    var carts : [Cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonSerialization()
    }
    
    func jsonSerialization(){
        url = URL(string: Constants.urlString)
        
        AF.request(url!).response { AFResponse in
            print(AFResponse.request!)
            print(AFResponse.data!)//
            print(AFResponse.error)
            print(AFResponse.result)//
            print("------------------")
            print(AFResponse.metrics!)
            print("------------------")
            print(AFResponse.value!)
            print("------------------")
            print(AFResponse.serializationDuration)
            
            switch AFResponse.result{
                
               case .success(let data):
                    print(data!)
                    print("===================")
                do{
                    let apiResponse = try JSONDecoder().decode(CartApiResponse.self, from: data!)
//                    print(apiResponse)
                    self.carts.append(contentsOf: apiResponse.carts)
                    print("===================")
//                    print(self.carts)
                    
                    for eachCart in self.carts{
                        var products = eachCart.products
                        
                        print(products)
                    }
                }catch{
                    print(error)
                }
               case .failure(let error):
                    print(error)
            }
        }
    }
}
