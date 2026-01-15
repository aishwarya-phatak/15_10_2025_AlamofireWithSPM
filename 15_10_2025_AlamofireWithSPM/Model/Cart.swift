//
//  Cart.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 15/01/26.
//

struct Cart : Decodable{
    var id : Int
    var products : [Product]
    var total : Double
    var discountedTotal : Double
    var userId : Int
    var totalProducts : Int
    var totalQuantity : Int
}
