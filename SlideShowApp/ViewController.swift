//
//  ViewController.swift
//  SlideShowApp
//
//  Created by h_nagao on 2020/08/02.
//  Copyright © 2020 haruka.nagao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像の用意
    var imageNo : Int = 0
    let images:[String] = ["spring.jpg","summer.jpg","autumn.jpg","winter.jpg"]
    
    var timer : Timer!
    var timer_sec : Int = 0
    var isRunSlide : Bool = false
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var buttonPreview: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonSlide: UIButton!
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        if(timer_sec%2 == 0){ self.buttonNextImage(self) }
    }
    
    //ロード時
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ShowImage(self.imageNo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let originalViewController:OriginalViewController = segue.destination as! OriginalViewController
        originalViewController.imageNo = self.imageNo
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){}
    
    //進むボタンタップ時
    @IBAction func buttonNextImage(_ sender: Any) {
        self.imageNo += 1
        if(self.imageNo >= images.count){ self.imageNo = 0}
        ShowImage(imageNo)
    }
    //戻るボタンタップ時
    @IBAction func buttonPreviewImage(_ sender: Any) {
        self.imageNo -= 1
        if(self.imageNo < 0){ self.imageNo = self.images.count-1}
        ShowImage(imageNo)
    }
    
    //再生or停止ボタンタップ時
    @IBAction func buttonStartOrStopSlide(_ sender: Any) {
        if(isRunSlide == false){StartSlide(); return;}
        StopSlide()
    }
    //自動スライド再生
    func StartSlide(){
        DisableButtons()
        buttonSlide.setTitle("停止", for: .normal)
        isRunSlide = true
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    //自動スライド停止
    func StopSlide(){
        EnableButtons()
        buttonSlide.setTitle("再生", for: .normal)
        isRunSlide = false
        self.timer_sec = 0
        self.timer.invalidate()
        self.timer = nil
    }
    //戻る進むボタンを有効にする
    func EnableButtons(){
        buttonNext.isEnabled = true
        buttonPreview.isEnabled = true
    }
    //戻る進むボタンを無効にする
    func DisableButtons(){
        buttonNext.isEnabled = false
        buttonPreview.isEnabled = false
    }
    
    //画像を表示する
    func ShowImage(_ no : Int){
        self.thumbnail.image = UIImage(named: images[no])
    }
}

