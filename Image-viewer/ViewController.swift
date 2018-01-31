//
//  ViewController.swift
//  Image-viewer
//
//  Created by Cheng-Shan Hsieh on 2017/11/23.
//  Copyright © 2017年 HsinTing Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView = UIImageView()
    let imagePicker = UIImagePickerController()
    var scrollView: UIScrollView!
    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBAction func goToAlbulmButton(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
        imageView = UIImageView(image: UIImage(named: "icon_photo"))
        
        //設定滾動區域及大小
        scrollView = UIScrollView(frame: view.bounds)
        let backgroundBlack = UIColor(red: 43/255.0, green: 43/255.0, blue: 43/255.0, alpha: 1)
        scrollView.backgroundColor = backgroundBlack
        scrollView.contentSize = imageView.bounds.size
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.delegate = self
        scrollView.maximumZoomScale = 2.0
        scrollView.zoomScale = 1.0
//        scrollView.bounces = true
        

        NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true

        NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: buttonContainerView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true

    }
    
    // 2.加了縮放功能 protocol (UIScrollViewDelegate) 需要implement 的function
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    //3. 為了讓圖片縮小填滿且有Aspect Fit
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height

        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale

        scrollView.zoomScale = minScale

    }
    
    //3. 呼叫
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.bounds.size)
        
    }
    
    //4.讓圖片置中, 每次縮放之後會被呼叫
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size

        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0

        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.frame = .init(origin: .zero, size: image.size)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}
