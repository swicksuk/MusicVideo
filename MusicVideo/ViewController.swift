//
//  ViewController.swift
//  MusicVideo
//
//  Created by Steve Wicks on 15/05/2016.
//  Copyright © 2016 swicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/uk/rss/topmusicvideos/limit=10/json", completion: didLoadData)

    }
    
    func didLoadData(result: String){
        //print(result)
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

