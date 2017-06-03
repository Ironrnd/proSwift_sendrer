//
//  ViewController.swift
//  Sender
//
//  Created by Andrew Belozerov on 30.04.17.
//  Copyright © 2017 Andrew Belozerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var mapsBtn: UIButton!
    @IBOutlet weak var youtubeBtn: UIButton!
    @IBOutlet weak var receiverBtn: UIButton!
    

    
    
    private func designFor(button: UIButton) {
        button.layer.cornerRadius = 8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designFor(button: mapsBtn)
        designFor(button: youtubeBtn)
        designFor(button: receiverBtn)
    }
    
    @IBAction func mapsBtnTapped(_ sender: UIButton) {
        let path = "http://maps.apple.com/?q="
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: path+searchQuerry)!
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }

    @IBAction func youtubeBtnTapped(_ sender: UIButton) {
        let path = "http://youtube.com/results?search_query="
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: path+searchQuerry)!
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func receiverBtnTapped(_ sender: UIButton) {
        let path = "receiverapp://"
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: path+searchQuerry)!
        
        let dataDict = [
            "Name":"Apple",
            "Year": 2017,
            "Device": "iPhone"] as [String : Any]
       
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: dataDict, completionHandler: nil)
        } else {
            let alert = UIAlertController(title: "Receiver не найден", message: "Приложение приемник ReceiverApp не установлено на данном устройстве", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: {
                _ in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
        }
    }

}

