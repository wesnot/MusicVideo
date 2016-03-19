//
//  ViewController.swift
//  MusicVideo
//
//  Created by wesley on 19/03/2016.
//  Copyright © 2016 wesley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //call API
        
        let api = APIManager()
        api.loadData("https://itunes.apple.com/gb/rss/topmusicvideos/limit=10/json",
            completion: didLoadData)
        
        
        
        
        
    }

    func didLoadData(result:String) {
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            // do somthing if you want
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

