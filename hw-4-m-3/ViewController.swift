//
//  ViewController.swift
//  hw-4-m-3
//
//  Created by Kamila on 8/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodAppTableView: UITableView!
    
    var food: [Food] = [
        Food(image: "burger", title: "Фирменный Beef Burger", desc: "Хрустящая ржаная булочка, фирменная говяжья котлета, листья салата, свежие помидоры, соленые огурцы, кисло-сладкий соус", price: 220),
        Food(image: "clubSandwich", title: "Клаб Сэндвич", desc: "Американский тостерный хлеб, филе куриной грудки, листья салата, соус Цезарь, свежие помидоры", price: 180),
        Food(image: "fries", title: "Картофель фри", desc: "Картофель, соль", price: 80),
        Food(image: "pizza", title: "Пицца Ассорти", desc: "Говядина, соленые огурцы, колбаса салями, маслины, грибы, лук, помидоры", price: 450),
        Food(image: "salad", title: "Салат Цезарь с курицей", desc: "Куриная грудка, помидоры, листья салата, сухарики, соус Цезарь, куриное яйцо", price: 250),
        Food(image: "pasta", title: "Спагетти Балоньезе", desc: "Лук, мясной фарш, сладкий перец, помидоры, спагетти, сыр", price: 380),
        Food(image: "soup", title: "Грибной суп", desc: "Сытный крем-суп приготовлен из грибов", price: 230),
        Food(image: "pancakes", title: "Панкейки", desc: "Американские панкейки подаются со сливочным маслом и кленовым сиропом", price: 200),
        Food(image: "cheesecake", title: "Чизкейк Баноффи", desc: "сырный слой с карамелью и карамель соленая", price: 220)]
    
    var basket: [Basket] = []
    
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addButton.layer.cornerRadius = 20
        addButton.setTitle("Корзина: \(basket.count)", for: .normal)
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
        let secondVc = storyboard?.instantiateViewController(withIdentifier: "basket_vc") as! BasketViewController
        
        secondVc.basket = basket
        
        navigationController?.pushViewController(secondVc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as! FoodCell
        
        cell.foodImageView.image = UIImage(named: food[indexPath.row].image)
        cell.foodTitleLabel.text = food[indexPath.row].title
        cell.foodDescLabel.text = food[indexPath.row].desc
        cell.foodPriceLabel.text = "\(food[indexPath.row].price) сом"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        basket.append(Basket(basketImage: food[indexPath.row].image, basketTitle: food[indexPath.row].title, basketDesc: food[indexPath.row].desc, basketPrice: food[indexPath.row].price))
        addButton.setTitle("Корзина: \(basket.count)", for: .normal)
    }
}
