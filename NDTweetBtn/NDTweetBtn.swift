//
//  NDTweetBtn.swift
//  NDTweetBtn
//
//  Created by craptone on 2021/04/21.
//

import UIKit

@available(iOS 13.0, *)
private class NDActionButton: UIView {
    public lazy var imageView: UIImageView = {
       let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        // FIXME initで
//        view.image = UIImage(systemName: "note.text.badge.plus")
        return view
    }()
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        
        layer.cornerRadius = frame.width / 2
        addSubview(imageView)
        
    }
    
    public func setImage(_ image: UIImage) {
        imageView.image = image
    }
}

//public class


@available(iOS 13.0, *)
@IBDesignable
public class NDTweetBtn: UIView{
    private var isPressing = false {
        didSet {
            if isPressing { onPressing() }
            else { onRelease() }
        }
    }
    
    private lazy var baseButton: NDActionButton = {
        let view = NDActionButton(frame: bounds)
        view.backgroundColor = UIColor(red: 0.16, green: 0.62, blue: 0.95, alpha: 1)
//        view.clipsToBounds = true
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.onLongPressed))
        view.addGestureRecognizer(longPress)
        
        view.setImage(UIImage(systemName: "note.text.badge.plus")!)
//        let panGR = UIPanGestureRecognizer(target: self, action: #selector(self.onPan))
//        view.addGestureRecognizer(panGR)
//        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        imgView.image = UIImage(systemName: "note.text.badge.plus")
//        imgView.tintColor = .white
//        imgView.center = view.center
//        view.addSubview(imgView)
//        view.layer.cornerRadius = self.frame.width / 2
        return view
    }()
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

//        setupAttributes()

    }
    private lazy var actionBtn1: NDActionButton = {
       let view = NDActionButton(frame: bounds)
        view.frame.origin.x -= 90
        view.frame.origin.y -= 90
        view.backgroundColor = UIColor(red: 0.16, green: 0.62, blue: 0.95, alpha: 1)
        view.setImage(UIImage(systemName: "pencil")!)
        return view
    }()
    
    private lazy var actionBtn2: NDActionButton = {
       let view = NDActionButton(frame: bounds)
        view.frame.origin.x -= 120
        view.frame.origin.y -= 10
        view.backgroundColor = UIColor(red: 0.16, green: 0.62, blue: 0.95, alpha: 1)
        view.setImage(UIImage(systemName: "moon")!)
        return view
    }()
    
    private lazy var actionBtn3: NDActionButton = {
       let view = NDActionButton(frame: bounds)
        view.frame.origin.x -= 0
        view.frame.origin.y -= 130
        view.backgroundColor = UIColor(red: 0.16, green: 0.62, blue: 0.95, alpha: 1)
        view.setImage(UIImage(systemName: "light.min")!)
        return view
    }()
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.onLongPressed))
//        addGestureRecognizer(longPress)

//        clipsToBounds = true
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.frame.width / 2
        
        addSubview(baseButton)
        
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isPressing {
            isPressing = !isPressing

        }
    }
    
//    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if isPressing { print("moving" )}
//    }
    
    @objc func onPan(sender: UIPanGestureRecognizer) {
        if isPressing { print("panning") }
    }
    
    @objc func onLongPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
        isPressing = !isPressing
        }else if sender.state == .changed {
//            print("changed", sender.location(in: baseButton))
            guard let actionIndex = whichActionBtn(point: sender.location(in: baseButton)) else { return }
            // FIXME
            var actionBtns = [actionBtn1, actionBtn2, actionBtn3]
            UIView.animate(withDuration: 0.1, animations: {
                actionBtns[actionIndex - 1].transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            actionBtns.remove(at: actionIndex - 1)
            UIView.animate(withDuration: 0.1, animations: {
                actionBtns.forEach({ $0.transform = CGAffineTransform(scaleX: 1, y: 1)})
            })
        }else if sender.state == .ended {
            [self.actionBtn1, self.actionBtn2, self.actionBtn3]
                .forEach{ $0.transform = CGAffineTransform(scaleX: 1, y: 1)}
            isPressing = false
//            UIView.animate(withDuration: 0.1, animations: {
//                [self.actionBtn1, self.actionBtn2, self.actionBtn3]
//                    .forEach{ $0.transform = CGAffineTransform(scaleX: 1, y: 1) }
//            })
        }
    }
    
    private func onPressing() {
        baseButton.backgroundColor = .white
        baseButton.setImage(UIImage(systemName: "xmark")!)
        baseButton.imageView.tintColor = .darkGray
        baseButton.imageView.frame.size = CGSize(width: 20, height: 20)
        baseButton.imageView.center = baseButton.center
        
        [self.actionBtn1, self.actionBtn2, self.actionBtn3]
            .forEach{
                $0.frame = baseButton.bounds
                $0.alpha = 1
                addSubview($0)
            }

        UIView.animate(withDuration: 0.1, animations: {
            self.actionBtn1.frame.origin = self.baseButton.frame.insetBy(dx: -90, dy: -90).origin
            self.actionBtn2.frame.origin = self.baseButton.frame.insetBy(dx: -120, dy: -10).origin
            self.actionBtn3.frame.origin = self.baseButton.frame.insetBy(dx: -5, dy: -130).origin
            self.baseButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
        }, completion: {_ in
            self.baseButton.layer.cornerRadius = self.baseButton.bounds.width / 2
        })
        
    }
    
    private func onRelease() {
        baseButton.backgroundColor = UIColor(red: 0.16, green: 0.62, blue: 0.95, alpha: 1)
        baseButton.setImage(UIImage(systemName: "note.text.badge.plus")!)
        baseButton.imageView.tintColor = .white
        baseButton.imageView.frame.size = CGSize(width: 30, height: 30)
        baseButton.imageView.center = baseButton.center
        
        UIView.animate(withDuration: 0.1, animations: {
            self.baseButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            [self.actionBtn1, self.actionBtn2, self.actionBtn3]
                .forEach{
                    $0.frame = self.baseButton.bounds
                    $0.alpha = 0
                }
        }, completion: {_ in
            self.actionBtn1.removeFromSuperview()
            self.actionBtn2.removeFromSuperview()
            self.actionBtn3.removeFromSuperview()
        })
        
    }
    private func whichActionBtn(point: CGPoint) -> Int?{
        let diff = point.x - point.y
        if diff > -70 && diff < 70 {
            return 1
        }else if diff < 70 {
            return 2
        }else if diff > 70 {
            return 3
        }else {
            return nil
        }
    }
    
    

}
