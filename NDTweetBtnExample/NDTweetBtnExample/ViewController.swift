//
//  ViewController.swift
//  NDTweetBtnExample
//
//  Created by craptone on 2021/04/21.
//

import UIKit
import NDTweetBtn

class ViewController: UIViewController {
    @IBOutlet weak var resLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = NDTweetBtn(frame: CGRect(x: view.bounds.width - 100, y: 700, width: 60, height: 60))

        let action1 = NDTweetBtnAction(
                image: UIImage(systemName: "flame")!,
                handler: { (NDTweetBtnAction) -> Void in
                    print("flame")
                    self.resLabel.text = "flame"
                })

        let action2 = NDTweetBtnAction(
                image: UIImage(systemName: "cloud.bolt.rain.fill")!,
                handler: { (NDTweetBtnAction) -> Void in
                    print("cloud")
                    self.resLabel.text = "cloud"
                })

        let action3 = NDTweetBtnAction(
                image: UIImage(systemName: "moon.stars")!,
                handler: { (NDTweetBtnAction) -> Void in
                    print("moon")
                    self.resLabel.text = "moon"
                })
        
        btn.tapped = tapped

        btn.addAction(action: action1)
        btn.addAction(action: action2)
        btn.addAction(action: action3)

        btn.setImage(UIImage(systemName: "swift")!)

        view.addSubview(btn)
    }
    
    func tapped() {
        print("swift")
        self.resLabel.text = "swift"
    }


}

