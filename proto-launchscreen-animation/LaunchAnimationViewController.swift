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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
        imageView.image = UIImage(named: "launch-image")
        return imageView
    }()
    
    // If you want a function to execute only once no matter how many times its called
    // Declate a lazy var of type Void
    // Making the varibale lazy ensures that the constructor is not called when VC is loaded
    private lazy var loadHomeVC: Void = {
        // This is a constructor that is called once when the variable is instantiated
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            let viewController = HomeViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)

        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in ViewDidLoad")
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        // Add imageview as a subview.
        // Adding a subview or changing the size / rect of view causes the method viewDidLayoutSubviews to be called
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("in ViewDidLayoutSubviews")
        imageView.center = view.center
        // run animation code with .5 sec delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5, execute: {
            self.animate()
        })
        
        
    }
    
    private func animate(){
        print("animate called")
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            // Changing the size / rect of a view causes function "viewDidLayoutSubviews" to be called again
            self.imageView.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size
            )
                        
        }) { flag in
            print("scale animation completed: \(flag)")
        }
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }) { flag in
            print("fade animation completed: \(flag)")
            // at the time of this assignment, the variable loadHomeVC is instantiated lazily and the constructor is called.
            // using the same variable again, does not call the constructor
            _ = self.loadHomeVC
        }
        
    }


}

