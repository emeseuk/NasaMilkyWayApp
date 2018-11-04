//
//  MilkyWayTableViewController.swift
//  NasaMilkyWayApp
//
//  Created by Emese Toth on 04/11/2018.
//  Copyright © 2018 Emese Toth. All rights reserved.
//

import UIKit
import Kingfisher

class MilkyWayTableViewController: UITableViewController {
    var data = [MilkyWayData]()
    
    @IBOutlet weak var errorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.clear
        tableView.accessibilityIdentifier = "MilkyWayTableId"
        errorMessage.isHidden = true
        
        NetworkManager().getResponse(completion: { res, err  in
            if let _ = err {
                self.errorMessage.isHidden = false
                return
            }
            guard let response = res else { return }
            self.data = response
            self.tableView.reloadData()
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MilkyWayTableViewCell
        
        let date = data[indexPath.row].date
        let details = data[indexPath.row].center + " | " + date.toDate(date).toString(dateFormat: "YYYY-MM-dd")
        cell.detailsLabel.text = details
        
        let url = URL(string: data[indexPath.row].imageUrl)!
        cell.thumbnailImageView.kf.setImage(with: url)
        
        cell.titleLabel.text = data[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMilkyWayDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MilkyWayDetailViewController
                destinationController.detailImageUrl = data[indexPath.row].imageUrl
                destinationController.detailTitle = data[indexPath.row].title
                destinationController.detailCenter = data[indexPath.row].center
                destinationController.detailDate = data[indexPath.row].date
                destinationController.detailDescription = data[indexPath.row].description
            }
        }
    }
    
    func displayNoInternetAlert(){
        let alertController = UIAlertController(title: "No Internet", message: "It appears that your iPhone is not connected to internet.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(_ date: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from:date)!
    }
}
