
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
        if  stopflag == 0 && self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
             (sender as AnyObject).setTitle("停止", for: .normal)
            stopflag = 1//再生と停止を判断
            motionflag = 1//フラグが１になれば再生できない
        }
        else if stopflag == 1 && self.timer != nil{
            (sender as AnyObject).setTitle("再生", for: .normal)
            stopflag = 0
            self.timer.invalidate()
             self.timer = nil
            motionflag = 0
        }
    }
   
    //タイマー
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
    
    //画像タップすると次ページ拡大画像
    // ①セグエ実行前処理
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // ②Segueの識別子確認
           let NextController:NextController = segue.destination as! NextController
           // 値の設定
           NextController.flag = imageIndex
        }
       
}

