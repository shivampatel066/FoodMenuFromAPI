//
//  FoodListViewController.swift
//  FoodMenuFromAPI
//
//  Created by Shivam Patel on 22/05/22.
//

import UIKit

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var nonVegSwitch: UISwitch!
    
    var foodList:[FoodModel] = [] {
        didSet{
            DispatchQueue.main.async {
                if self.vegSwitch.isOn {
                    self.displayList = self.foodList.filter{
                        $0.foodType.lowercased() == FoodType.veg.rawValue
                    }
                } else {
                    self.displayList = self.foodList.filter{
                        $0.foodType.lowercased() == FoodType.nonVeg.rawValue
                    }
                }
            }
            
        }
    }
    var displayList:[FoodModel] = []
    let foodAPIURL = "http://54.149.84.126/api/user/categories?shop=1"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spinner = UIActivityIndicatorView(style: .large)
        self.foodTableView.backgroundView = spinner
        spinner.startAnimating()
        
        APIHelper.shareInstance.getFoodItemsFromAPI(baseURL:foodAPIURL) { foodList in
            self.foodList = foodList
            
            DispatchQueue.main.async {
                if self.displayList.count > 0 {
                    self.foodTableView.isHidden = false
                } else {
                    self.foodTableView.isHidden = true
                }
                spinner.stopAnimating()
                self.foodTableView.reloadData()
            }
        }
    }
    
    @IBAction func switchChangedButton(_ sender: UISwitch) {
        if (sender.tag == FoodTypeInt.veg.rawValue) {
            self.nonVegSwitch.setOn(!self.nonVegSwitch.isOn, animated: true)
        } else {
            self.vegSwitch.setOn(!self.vegSwitch.isOn, animated: true)
        }
        DispatchQueue.main.async {
            if self.vegSwitch.isOn {
                self.displayList = self.foodList.filter{
                    $0.foodType.lowercased() == FoodType.veg.rawValue
                }
            } else {
                self.displayList = self.foodList.filter{
                    $0.foodType.lowercased() == FoodType.nonVeg.rawValue
                }
            }
            self.foodTableView.reloadData()
        }
    }
}


// MARK: TableView Datasource Methods.
extension FoodListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMenuTableViewCell") as? FoodMenuTableViewCell else {
            return UITableViewCell()
        }
        cell.foodObject = displayList[indexPath.row]
        cell.configureUI()
        return cell
    }
}

