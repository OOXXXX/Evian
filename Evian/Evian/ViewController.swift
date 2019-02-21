//
//  ViewController.swift
//  Evian
//
//  Created by Rhapsody on 2019/2/19.
//  Copyright © 2019 Back to Bedlam. All rights reserved.
//

import UIKit
let SCREEN_SIZE = UIScreen.main.bounds.size

class ViewController: UIViewController{

    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.view.backgroundColor = UIColor.init(red: 254.0/255.0, green: 228.0/255.0, blue: 17.0/255.0, alpha: 1.0)
        
        let rect = CGRect(x: 30, y: 100, width: 355, height: 90)
        let label = UILabel(frame: rect)
        label.text = "即刻"
        label.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        label.backgroundColor = UIColor.brown
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
       
        let botton = UIButton(type: .custom)
        botton.frame = CGRect(x: 30, y: 300, width: 355, height: 90)
        botton.layer.cornerRadius = 20
        botton.layer.masksToBounds = true
        botton.backgroundColor = UIColor.brown
        botton.setTitle("变色", for: UIControl.State())
        botton.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        botton.addTarget(self, action: #selector(changeColour), for: .touchUpInside)
        self.view.addSubview(botton)
        
        let btHideNavBar = UIButton(frame: CGRect(x: 30, y: 200, width: 355, height: 90))
        btHideNavBar.setTitle("隐藏", for: UIControl.State())
        btHideNavBar.backgroundColor = UIColor.brown
        btHideNavBar.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        btHideNavBar.layer.cornerRadius = 20
        btHideNavBar.addTarget(self, action: #selector(ViewController.hideNavigationBar), for:  .touchUpInside)
        self.view.addSubview(btHideNavBar)
        
        let topLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        topLabel.text = "主页面"
        topLabel.textAlignment = NSTextAlignment.center
        topLabel.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = topLabel
        
        
        
    }
    
    @objc func hideNavigationBar()
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func changeColour()
    {
       self.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
    }
    


}

