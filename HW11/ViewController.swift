//
//  ViewController.swift
//  HW11
//
//  Created by Evgeny on 18.05.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewCircle: UIView!
    @IBOutlet weak var ImageView: UIImageView!
    
    var timer: Timer?
    var count = 0
    var images:[UIImage] = []

    override func viewDidLoad() {
        self.viewCircle.layer.cornerRadius = self.viewCircle.frame.height/2

        timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true, block: { _ in
            UIView.animate(withDuration: 2, delay: 0, options: .allowAnimatedContent) {
                self.view.layoutIfNeeded()
                self.viewCircle.center.x += 212
                self.viewCircle.backgroundColor = self.random()
            } completion: { animation in
                UIView.animate(withDuration: 2, delay: 0, options: .allowAnimatedContent) {
                self.viewCircle.center.y += 212
                    self.viewCircle.backgroundColor = self.random()

                } completion: { animation in
                    UIView.animate(withDuration: 2, delay: 0, options: .allowAnimatedContent) {
                    self.viewCircle.center.x -= 212
                        self.viewCircle.backgroundColor = self.random()

                    } completion: { animation in
                        UIView.animate(withDuration: 2, delay: 0, options: .allowAnimatedContent) {
                        self.viewCircle.center.y -= 212
                            self.viewCircle.backgroundColor = self.random()
                        }
                    }
                }
            }
        })
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftGesture.direction = .left
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightGesture.direction = .right
        
        self.view.addGestureRecognizer(leftGesture)
        self.view.addGestureRecognizer(rightGesture)
        super.viewDidLoad()
    }

    @objc func didSwipe(sender: UISwipeGestureRecognizer){
    switch sender.direction {
        case .left:
        switch count{
        case 0: count += 1
        case 1: count += 1
        case 2: count = 0
        default:
            break
        }
        ImageView.image = UIImage(named: String(count + 1))
        case .right:
        switch count{
        case 0: count = 2
        case 1: count -= 1
        case 2: count -= 1
        default:
            break
        }
        default:
            break
        }
        ImageView.image = UIImage(named: String(count + 1))
    }
    
    func random() -> UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue:  .random(in: 0...1),
                          alpha: 1.0)
       }

}

