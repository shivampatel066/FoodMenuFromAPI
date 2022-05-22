//
//  FoodModel.swift
//  FoodMenuFromAPI
//
//  Created by Shivam Patel on 22/05/22.
//

import Foundation

struct Result:Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category:Codable {
    let id:Int
    let products: [FoodModel]
}


// MARK: - Image
struct Image:Codable {
    let url: String
    let position: Int
}

struct FoodModel: Codable {
    let id, shopID: Int
    let name, productDescription: String
    let position: Int
    let foodType: String
    let avalability, maxQuantity, featured, featuredPosition: Int
    let addonStatus: Int
    let outOfStock:String
    let prices: Prices
    let images: [Image]
    let orderratings: Orderratings?


    enum CodingKeys: String, CodingKey {
        case id
        case shopID = "shop_id"
        case name
        case productDescription = "description"
        case position
        case foodType = "food_type"
        case avalability
        case maxQuantity = "max_quantity"
        case featured
        case featuredPosition = "featured_position"
        case addonStatus = "addon_status"
        case outOfStock = "out_of_stock"
        case orderratings
        case prices, images
        
    }
}

enum FoodType: String, Codable {
    case nonVeg = "non-veg"
    case veg = "veg"
}

// MARK: - Orderratings
struct Orderratings: Codable {
    let rating:Int

    enum CodingKeys: String, CodingKey {
        case rating
    }
}

// MARK: - Prices
struct Prices: Codable {
    let id, price, orignalPrice: Int
    let currency: String
    let discount: Int
    let discountType: String

    enum CodingKeys: String, CodingKey {
        case id, price
        case orignalPrice = "orignal_price"
        case currency, discount
        case discountType = "discount_type"
    }
}

enum FoodTypeInt:Int {
    case veg = 1
    case nonVeg = 2
}

//// MARK: - Productsinglerating
//struct Productsinglerating: Codable {
//    let id, orderID, shopID, userID: Int
//    let productID: Int
//    let productComment: String
//    let productRating: Int
//    let status: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case orderID = "order_id"
//        case shopID = "shop_id"
//        case userID = "user_id"
//        case productID = "product_id"
//        case productComment = "product_comment"
//        case productRating = "product_rating"
//        case status
//    }
//}
//
//
//
