//
//  Product.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 15/01/26.
//

struct Product : Decodable{
    var id : Int
    var title : String
    var price: Double
    var quantity : Int
    var total : Double
    var discountPercentage : Double
    var discountedTotal : Double
    var thumbnail : String
}
