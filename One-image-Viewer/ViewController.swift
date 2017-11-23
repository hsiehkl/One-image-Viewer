//
//  ViewController.swift
//  One-image-Viewer
//
//  Created by Cheng-Shan Hsieh on 2017/11/23.
//  Copyright © 2017年 HsinTing Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var containerView : UIView!
    @IBOutlet weak var palceholderImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup placeholder image
        palceholderImageView.image = UIImage(named: "icon_photo")?.withRenderingMode(.alwaysTemplate)
        palceholderImageView.tintColor = UIColor.white
        imageView = UIImageView(image: UIImage(named: "icon_photo"))
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 375, height: 590)
        
        containerView = UIView()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
        scrollView.bounces = false
        
        containerView.addSubview(imageView)
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

