//
//  ViewController.swift
//  SlideShowApp
//
//  Created by h_nagao on 2020/08/02.
//  Copyright © 2020 haruka.nagao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像の準備
    var imageNo : Int = 0;
    let images:[String] = ["spring.jpg","summer.jpg","fall.jpg","winter.jpg"]
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    //ロード時
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ShowImage(self.imageNo)

    }
    
    //Action
    @IBAction func unwind(_ segue: UIStoryboardSegue){}
    
    @IBAction func buttonNextImage(_ sender: Any) {
        self.imageNo += 1;
        ShowImage(self.imageNo)
    }
    
    @IBAction func buttonPreviewImage(_ sender: Any) {
        self.imageNo -= 1;
        ShowImage(self.imageNo)
    }
    
    //表示画像の設定
    func ShowImage (_ no : Int){
        self.thumbnail.image = UIImage(named: images[no]);
    }
    

    

    

    

    
}

