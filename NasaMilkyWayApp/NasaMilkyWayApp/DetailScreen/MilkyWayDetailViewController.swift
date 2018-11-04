//
//  ViewController.swift
//  NasaMilkyWayApp
//
//  Created by Emese Toth on 04/11/2018.
//  Copyright © 2018 Emese Toth. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class MilkyWayDetailViewController: UIViewController {

    @IBOutlet var milkyWayImage : UIImageView!
    @IBOutlet var milkyWayTitle : UILabel!
    @IBOutlet var milkyWayCenter : UILabel!
    @IBOutlet var milkyWayDate : UILabel!
    @IBOutlet var milkyWayDescription : UITextView!
    
    var detailImageUrl = ""
    var detailTitle = ""
    var detailCenter = ""
    var detailDate = ""
    var detailDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        milkyWayImage.kf.setImage(with: URL(string: detailImageUrl)!)
        milkyWayTitle.text = detailTitle
        milkyWayCenter.text = detailCenter
        milkyWayDate.text = detailDate.toDate(detailDate).toString(dateFormat: "YYYY-MM-dd")
        milkyWayDescription.text = detailDescription
        
        milkyWayDescription.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        milkyWayDescription.isScrollEnabled = true
    }
}



