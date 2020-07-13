//
//  ViewController.swift
//  slideshowApp
//
//  Created by 前田蓮太 on 2020/07/08.
//  Copyright © 2020 renta.Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dammy: UIButton!
   
    
    
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var startstopImage2: UIButton!
    let images = [UIImage(named: "17388b7f608671656716ab509ee0fa05.png"), UIImage(named: "icon_bulbasaur.png"), UIImage(named: "スクリーンショット-2020-01-10-11.40.50.png")]

     var imageIndex = 0
    var timer : Timer!
    var stopflag = 0
    var motionflag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = images[0]
        UIImageView.image = imageView
        
         //ボタンのテキストを変える
        if stopflag == 1{
            dammy.setTitle("俺がボタンだ", for: .normal) // ボタンのタイトル
        }
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    //ボタン処理
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 && motionflag == 0{
                 imageIndex = 0
             } else if motionflag == 0 {
                 imageIndex += 1
             }
             UIImageView.image = images[imageIndex]
    }
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 && motionflag == 0{
                   imageIndex = 2
               } else if motionflag == 0{
                   imageIndex -= 1
               }
               UIImageView.image = images[imageIndex]
    }
    
    @IBAction func startstopImage(_ sender: Any) {
        if stopflag == 0{
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            stopflag = 1        //フラグが１になれば再生できない
            motionflag = 1
        }
       
    }
   
    
        @objc func onTimer(_ timer: Timer) {
            if imageIndex == 2 {
                imageIndex = 0
            }
            else {
                imageIndex += 1
            }
            UIImageView.image = images[imageIndex]

        }
    
    //拡大ページから戻る
      @IBAction func unwind(_ segue: UIStoryboardSegue) {
         }
    //画像をタップすると次ページへ
      @IBAction func tapAction(_ sender: Any) {
             performSegue(withIdentifier: "result", sender: nil)

         }
    // ①セグエ実行前処理
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // ②Segueの識別子確認
           if segue.identifier == "result" {
               // ③遷移先ViewCntrollerの取得
            _ = segue.destination as! NextController
    
               // ④値の設定
            UIImageView.image = images[imageIndex]
            
        }
       }
}

