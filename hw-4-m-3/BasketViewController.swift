//
//  BasketViewController.swift
//  hw-4-m-3
//
//  Created by Kamila on 8/1/23.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var basketTableView: UITableView!
    
    var basket: [Basket] = []
    
    var addButton = UIButton()
    
    var amount = 0
    
    //DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basket_cell", for: indexPath) as! BasketCell
        
        cell.basketImageView.image = UIImage(named: basket[indexPath.row].basketImage)
        cell.basketTitleLabel.text = basket[indexPath.row].basketTitle
        cell.basketDescLabel.text = basket[indexPath.row].basketDesc
        cell.basketPriceLabel.text = "\(basket[indexPath.row].basketPrice) сом"
        
        return cell
    }
    
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in basket{
            amount += i.basketPrice
        }
        
        //Label
        let totalLabel = UILabel(frame: CGRect(x: 25, y: 700, width: 200, height: 30))
        totalLabel.text = " Итого: \(amount)"
        totalLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        totalLabel.textColor = .black

        self.view.addSubview(totalLabel)
        
        
        //Button
        addButton.layer.cornerRadius = 20
        addButton.setTitle("Заказать", for: .normal)
        addButton.backgroundColor = .orange
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)

        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 355).isActive = true
    }
    
    @objc func addButtonTap() {
        let deliveryVc = storyboard?.instantiateViewController(withIdentifier: "delivery_vc") as! DeliveryViewController
        
        navigationController?.pushViewController(deliveryVc, animated: true)
    }
}

