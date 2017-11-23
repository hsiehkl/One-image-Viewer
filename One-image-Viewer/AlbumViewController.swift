//
//  AlbumViewController.swift
//  One-image-Viewer
//
//  Created by Cheng-Shan Hsieh on 2017/11/23.
//  Copyright © 2017年 HsinTing Hsieh. All rights reserved.
//

import UIKit



class AlbumViewController: UIViewController {
    

    @IBAction func button02(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        UIApplication.shared.keyWindow?.rootViewController = view
        
//        view.selectedphoto = "02"
        
    }
    @IBAction func button01(_ sender: Any) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        UIApplication.shared.keyWindow?.rootViewController = view
        
//        view.selectedphoto = "01"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
