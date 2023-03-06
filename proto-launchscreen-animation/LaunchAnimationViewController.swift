//
//  ViewController.swift
//  proto-launchscreen-animation
//
//  Created by Santosh Krishnamurthy on 3/5/23.
//

import UIKit

class LaunchAnimationViewController: UIViewController {

    private let label: UILabel = {
        var label: UILabel = UILabel()
        label.backgroundColor = .green
        label.tintColor = .link
        label.text = "Hello"
        return label
    }()
    
    // Create a image view with logo
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 124, height: 124))
        imageView.image = UIImage(named: "launch-image")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        // Add imageview as a subview
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.center = view.center
        // run animation code with .5 sec delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute: {
            self.animate()
        })
        
        
    }
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size
            )
        }) { flag in
            print("animation completed")
        }
    }


}

