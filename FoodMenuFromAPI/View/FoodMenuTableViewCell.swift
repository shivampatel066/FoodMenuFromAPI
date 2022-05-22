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
    
    var foodObject:FoodModel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    public func configureUI() {
        if let foodObject = foodObject {
            self.itemNameLabel.text = ""
        }
    }
}
