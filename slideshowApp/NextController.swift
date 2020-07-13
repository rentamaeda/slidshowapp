//
//  NextController.swift
//  slideshowApp
//
//  Created by 前田蓮太 on 2020/07/08.
//  Copyright © 2020 renta.Maeda. All rights reserved.
//

import UIKit

class NextController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    let images = [UIImage(named: "17388b7f608671656716ab509ee0fa05.png"), UIImage(named: "icon_bulbasaur.png"), UIImage(named: "スクリーンショット-2020-01-10-11.40.50.png")]

    var imageIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageViews = images[0]
        UIImageView.image = imageViews
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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
