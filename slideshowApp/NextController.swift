

import UIKit

class NextController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    let images = [UIImage(named: "17388b7f608671656716ab509ee0fa05.png"), UIImage(named: "icon_bulbasaur.png"), UIImage(named: "スクリーンショット-2020-01-10-11.40.50.png")]

    var imageIndex = 0
    var flag = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = images[0]

        
     UIImageView.image = images[flag]

    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
     
    
}
