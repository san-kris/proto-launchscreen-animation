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
        

    }


}

