//
//  ViewController.swift
//  15_10_2025_AlamofireWithSPM
//
//  Created by Vishal Jagtap on 15/01/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var url : URL?
    var carts : [Cart] = []
    var reuseIdentifierForCartTableViewCell = "CartTableViewCell"
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewAndCell()
        jsonSerialization()
    }
    
    func registerTableViewAndCell(){
        cartTableView.dataSource = self
        cartTableView.delegate = self
        let uiNib = UINib(nibName: reuseIdentifierForCartTableViewCell, bundle: nil)
        self.cartTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForCartTableViewCell)
    }
    
    func jsonSerialization(){
        url = URL(string: Constants.urlString)
        
        AF.request(url!).response { AFResponse in
            print(AFResponse.request!)
            print(AFResponse.data!)//
            print(AFResponse.error)
            print(AFResponse.result)//
            print("------------------")
            print(AFResponse.metrics!)
            print("------------------")
            print(AFResponse.value!)
            print("------------------")
            print(AFResponse.serializationDuration)
            
            switch AFResponse.result{
                
               case .success(let data):
                    print(data!)
                    print("===================")
                do{
                    let apiResponse = try JSONDecoder().decode(CartApiResponse.self, from: data!)
//                    print(apiResponse)
                    self.carts.append(contentsOf: apiResponse.carts)
                    print("===================")
//                    print(self.carts)
                    
                    for eachCart in self.carts{
                        var products = eachCart.products
                        
                        print(products)
                    }
                }catch{
                    print(error)
                }
               case .failure(let error):
                    print(error)
            }
            
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.carts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartTableViewCell = self.cartTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForCartTableViewCell, for: indexPath) as? CartTableViewCell
        
        cartTableViewCell?.cartUserIdLabel.text = "\(self.carts[indexPath.row].userId)"
        cartTableViewCell?.cartDiscountedTotalLabel.text = "\(self.carts[indexPath.row].discountedTotal)"
        print(carts[indexPath.row].products)
        
        cartTableViewCell?.products = carts[indexPath.row].products
      
        return cartTableViewCell ?? UITableViewCell()
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
