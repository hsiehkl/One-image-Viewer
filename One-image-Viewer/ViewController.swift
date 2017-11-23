//
//  ViewController.swift
//  One-image-Viewer
//
//  Created by Cheng-Shan Hsieh on 2017/11/23.
//  Copyright © 2017年 HsinTing Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var butoonView: UIView!
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    @IBOutlet weak var palceholderImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup placeholder image
        palceholderImageView.image = UIImage(named: "icon_photo")?.withRenderingMode(.alwaysTemplate)
        palceholderImageView.tintColor = UIColor.white
        imageView = UIImageView(image: UIImage(named: "02"))
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.minimumZoomScale = 0.0
        scrollView.maximumZoomScale = 2.0
        scrollView.bounces = false
        
        scrollView.addSubview(imageView)
//        scrollView.addSubview(butoonView)
        view.addSubview(scrollView)
        
    }
    
    func centerScrollViewContents(){
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame

        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        }
        else {
            contentsFrame.origin.x = 0
        }

        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = ((boundsSize.height - 77.0) - contentsFrame.size.height) / 2
        }
        else {
            contentsFrame.origin.y = 0
        }

        imageView.frame = contentsFrame
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        
        scrollView.zoomScale = minScale
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.bounds.size)
        
        scrollView.frame = view.bounds

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

