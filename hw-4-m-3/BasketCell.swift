//
//  BasketCell.swift
//  hw-4-m-3
//
//  Created by Kamila on 8/1/23.
//

import Foundation
import UIKit

class BasketCell: UITableViewCell {

    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var basketTitleLabel: UILabel!
    @IBOutlet weak var basketDescLabel: UILabel!
    @IBOutlet weak var basketPriceLabel: UILabel!
    @IBOutlet weak var basketBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        basketImageView.layer.cornerRadius = 20
        basketBgView.layer.cornerRadius = 20
        
        basketTitleLabel.numberOfLines = 2
        basketTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        basketDescLabel.numberOfLines = 2
        basketDescLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        basketDescLabel.textColor = .lightGray
        
        basketPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        basketPriceLabel.textColor = .orange
        
        
    }
    
}
