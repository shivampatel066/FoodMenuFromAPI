//
//  FoodListViewController.swift
//  FoodMenuFromAPI
//
//  Created by Shivam Patel on 22/05/22.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var foodTableView: UITableView!
    
    var displayList:[FoodModel] = []
    let foodAPIURL = " http://54.149.84.126/api/user/categories?shop=1"

    override func viewDidLoad() {
        super.viewDidLoad()

        APIHelper.shareInstance.getFoodItemsFromAPI(baseURL:foodAPIURL) { moviesList in
            self.moviesList = moviesList
            DispatchQueue.main.async {
                if self.moviesList.count > 0 {
                    self.foodTableView.isHidden = false
                } else {
                    self.foodTableView.isHidden = true
                }
                self.foodTableView.reloadData()
            }
        }
    }
}


// MARK: TableView Datasource Methods.
extension MovieListViewController:UITableViewDataSource {
    
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

