//
//  OriginalViewController.swift
//  SlideShowApp
//
//  Created by h_nagao on 2020/08/02.
//  Copyright © 2020 haruka.nagao. All rights reserved.
//

import UIKit

class OriginalViewController: UIViewController {
    
    var imageNo : Int = 0
    let images:[String] = ["spring.jpg","summer.jpg","autumn.jpg","winter.jpg"]

    @IBOutlet weak var imageViewOriginal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imageViewOriginal.image = UIImage(named: images[imageNo])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
