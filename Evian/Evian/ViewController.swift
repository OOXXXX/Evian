//
//  ViewController.swift
//  Evian
//
//  Created by Rhapsody on 2019/2/19.
//  Copyright © 2019 Back to Bedlam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        
        let rect = CGRect(x: 30, y: 100, width: 355, height: 90)
        let label = UILabel(frame: rect)
        label.text = "即刻"
        label.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 3))
        label.backgroundColor = UIColor.brown
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        
        self.view.addSubview(label)
    }


}

