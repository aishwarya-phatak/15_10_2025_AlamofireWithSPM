//
//  CartApiResponse.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 15/01/26.
//

struct CartApiResponse : Decodable{
    var carts : [Cart]
    var total : Int
    var skip : Int
    var limit : Int
}
