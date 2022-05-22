//
//  FoodMenuTableViewCell.swift
//  FoodMenuFromAPI
//
//  Created by Shivam Patel on 22/05/22.
//

import UIKit

class FoodMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemRatingLabel: UILabel!
    
    var foodObject:FoodModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    public func configureUI() {
        if let foodObject = foodObject {
            self.itemNameLabel.text = foodObject.name
            let imageURLString = "\(foodObject.images.count > 0 ? foodObject.images[0].url : "")"
            self.foodImageView.image = nil
            self.foodImageView.imageFromURL(urlString: imageURLString)
            self.itemTypeLabel.text = foodObject.foodType
            self.itemPriceLabel.text = "\(foodObject.prices.currency) \(foodObject.prices.orignalPrice)"
            if let rating = foodObject.orderratings?.rating {
                self.itemRatingLabel.text = "★ \(Double(rating)) Rating"
            } else {
                self.itemRatingLabel.text = "No ratings"
            }
        }
    }
}
