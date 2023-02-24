//
//  FoodCell.swift
//  hw-4-m-3
//
//  Created by Kamila on 8/1/23.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var bgFoodView: UIView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDescLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgFoodView.layer.cornerRadius = 20
        foodImageView.layer.cornerRadius = 20
        
        foodTitleLabel.numberOfLines = 2
        foodTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        foodDescLabel.numberOfLines = 2
        foodDescLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        foodDescLabel.textColor = .lightGray
        
        foodPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        foodPriceLabel.textColor = .orange
    }
}
