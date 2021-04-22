//
//  ViewController.swift
//  NDTweetBtnExample
//
//  Created by craptone on 2021/04/21.
//

import UIKit
import NDTweetBtn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = NDTweetBtn()
        btn.frame = CGRect(x: 100, y: 100, width: 60, height: 60)
//        btn.layer.cornerRadius = 30
//        btn.backgroundColor = .red
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }


}

