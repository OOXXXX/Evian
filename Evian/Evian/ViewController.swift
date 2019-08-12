//
//  ViewController.swift
//  Evian
//
//  Created by Rhapsody on 2019/2/19.
//  Copyright © 2019 Back to Bedlam. All rights reserved.
//

import UIKit
import AVFoundation
import MessageUI
import UserNotifications

@available(iOS 10.0, *)
var i = 0

let SCREEN_SIZE = UIScreen.main.bounds.size
class ViewController: UIViewController, AVAudioPlayerDelegate, UNUserNotificationCenterDelegate
{
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let localNotification = UILocalNotification()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.view.backgroundColor = UIColor.init(red: 254.0/255.0, green: 228.0/255.0, blue: 17.0/255.0, alpha: 1.0)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 30, y: 100, width: 315, height: 90)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.brown
        button.setTitle("即刻", for: UIControl.State())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        button.addTarget(self, action: #selector(jike), for: .touchUpInside)
        self.view.addSubview(button)
       
        let changeButton = UIButton(type: .custom)
        changeButton.frame = CGRect(x: 30, y: 300, width: 315, height: 90)
        changeButton.layer.cornerRadius = 20
        changeButton.layer.masksToBounds = true
        changeButton.backgroundColor = UIColor.brown
        changeButton.setTitle("变色", for: UIControl.State())
        changeButton.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        changeButton.addTarget(self, action: #selector(changeColour), for: .touchUpInside)
        self.view.addSubview(changeButton)
        
        
        
        let btHideNavBar = UIButton(frame: CGRect(x: 30, y: 200, width: 315, height: 90))
        btHideNavBar.setTitle("隐藏", for: UIControl.State())
        btHideNavBar.backgroundColor = UIColor.brown
        btHideNavBar.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        btHideNavBar.layer.cornerRadius = 20
        btHideNavBar.addTarget(self, action: #selector(ViewController.hideNavigationBar), for:  .touchUpInside)
        self.view.addSubview(btHideNavBar)
        
        let emailBtn = UIButton(frame: CGRect(x: 30, y: 400, width: 315, height: 90))
        emailBtn.setTitle("邮件", for: UIControl.State())
        emailBtn.backgroundColor = UIColor.brown
        emailBtn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: UIFont.Weight(rawValue: 2))
        emailBtn.layer.cornerRadius = 20
        emailBtn.addTarget(self, action: #selector(ViewController.sendEmail), for: UIControl.Event.touchUpInside)
        self.view.addSubview(emailBtn)
        
         
        
        let topLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        topLabel.text = "主页面"
        topLabel.textAlignment = NSTextAlignment.center
        topLabel.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = topLabel
        
        let now = Date()
        localNotification.fireDate = now.addingTimeInterval(216000)
        localNotification.repeatInterval = NSCalendar.Unit.init(rawValue: 0)
        localNotification.timeZone = .current
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.alertBody = "Hi, it's time to make a decision!"
        localNotification.applicationIconBadgeNumber = 1
        
        let infoDic = NSDictionary(object: "mseeage.", forKey: "infokey" as NSCopying)
        localNotification.userInfo = infoDic as [NSObject : AnyObject]
        
        UIApplication.shared.scheduleLocalNotification(localNotification)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setActive(true)
            if #available(iOS 10.0, *) 
            {
                try session.setCategory(.playback, mode:  .default)
            }
            UIApplication.shared.beginReceivingRemoteControlEvents()
            
            let path = Bundle.main.path(forResource: "Imagine", ofType: "mp3")
            let soundUrl = URL(fileURLWithPath: path!)
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 1.0
            audioPlayer.numberOfLoops = -1
            audioPlayer.delegate = self
            audioPlayer.play()
        }
        catch
        {
            print(error)
        }
     }
    
    @objc func hideNavigationBar()
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    @objc func changeColour()
    {
       self.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    @objc func sendEmail()
    {
        let mailBox = MFMailComposeViewController()
        self.present(mailBox, animated: true, completion: nil)
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
    }

    @objc func jike()
    {
        if let url  = URL(string: "https://web.okjike.com/login?redirect=/feed") // Change the URL with the URL Scheme
        {
            if UIApplication.shared.canOpenURL(url)
            {
                UIApplication.shared.openURL(url)
            }
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
    
    @IBAction func changeApp(_ sender: AnyObject)
    {
      
        if let url  = URL(string: "https://web.okjike.com/login?redirect=/feed") // Change the URL with the URL Scheme
        {
            if UIApplication.shared.canOpenURL(url)
            {
                UIApplication.shared.openURL(url)
            }
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
       
    }
    
    @objc func tapped() {
        i += 1
        print("Running \(i)")
        
        switch i {
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
        case 3:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        case 6:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            
        default:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            i = 0
        }
    
    }

}
