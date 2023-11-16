//
//  ViewController.swift
//  task
//
//  Created by Mac on 15/11/23.
//

import UIKit

class MyCustomHeaderView: UITableViewHeaderFooterView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18) // Set your desired font style
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)

        // Add constraints for the title label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableArr = ["ETH", "BNB", "ADA", "XRP", "SOL"]
    var subArr = ["Ethereum", "Binance Coin", "Cardano", "Ripple", "Solana"]
    var imgArry = ["🦆 icon _Ethereum Cryptocurrency_", "🦆 icon _Binance Coin Cryptocurrency_", "🦆 icon _Cardano Cryptocurrency_", "Group", "Group (1)"]
    var valuesArr = ["$3,800 USD", "$ 800 USD", "$ 200 USD", "$1.20 USD", "$ 50 USD"]
    var percentArr = ["-3.2%", "+1.8%", "-6.2%", "+1.5%", "-1.2%"]
    @IBOutlet weak var cyprtoTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cyprtoTableview.delegate = self
        cyprtoTableview.dataSource = self
        cyprtoTableview.register(UINib(nibName: "GraphTableViewCell", bundle: nil), forCellReuseIdentifier: "GraphTableViewCell")
        cyprtoTableview.register(UINib(nibName: "CyprtoTableViewCell", bundle: nil), forCellReuseIdentifier: "CyprtoTableViewCell")
        cyprtoTableview.register(MyCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderView")
        cyprtoTableview.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    

   
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            // Dequeue the custom header view
            let headerView = cyprtoTableview.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderView") as! MyCustomHeaderView
         if section == 0{
             headerView.titleLabel.text = "Cryptocurrency        NFT"
         }else{
             headerView.titleLabel.text = "Top Cryptocurrencies                                ViewAll"
         }
            return headerView
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return tableArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            var Cell = cyprtoTableview.dequeueReusableCell(withIdentifier: "GraphTableViewCell", for: indexPath) as! GraphTableViewCell
            
            return Cell
        }else{
            var indexCell = cyprtoTableview.dequeueReusableCell(withIdentifier: "CyprtoTableViewCell", for: indexPath) as! CyprtoTableViewCell
            indexCell.logoImg.image = UIImage(named: "\(imgArry[indexPath.row])")
            indexCell.logotitle.text = "\(tableArr[indexPath.row])"
            indexCell.logosubTitleLbl.text = "\(subArr[indexPath.row])"
            indexCell.pointerValue.text = "\(valuesArr[indexPath.row])"
            indexCell.pointerPercentageLbl.text = "\(percentArr[indexPath.row])"
            if indexPath.row % 2 == 0{
                indexCell.progressGraph.image = UIImage(named: "green")
                indexCell.pointerPercentageLbl.textColor = UIColor(named: "#00CE08")
            }else{
                indexCell.progressGraph.image = UIImage(named: "red")
                indexCell.pointerPercentageLbl.textColor = UIColor(named: "#FF3D00")
            }
            return indexCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 30
        }else{
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 131
        }
        return 100
    }
}

