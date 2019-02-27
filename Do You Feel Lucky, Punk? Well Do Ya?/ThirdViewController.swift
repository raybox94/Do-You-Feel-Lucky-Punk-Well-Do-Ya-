//
//  ThirdViewController.swift
//  Do You Feel Lucky, Punk? Well Do Ya?
//
//  Created by rayaan on 26/02/19.
//  Copyright © 2019 Northwest. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var minLBL: UILabel!
    
    @IBOutlet weak var maxLBL: UILabel!
    
    @IBOutlet weak var mean: UILabel!
    
    @IBOutlet weak var stdivLBL: UILabel!
    
    

    
    
    @IBAction func clearStatistics(_ sender: Any) {
        minLBL.text = "0"
        maxLBL.text = "0"
        mean.text = "0.0"
        stdivLBL.text = "0.0"
        Guesser.shared.clearStatistics()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minLBL.text = String(Guesser.shared.minimumNumAttempts())
        maxLBL.text = String(Guesser.shared.maximumNumAttempts())
        mean.text = String(format: "%.1f",Guesser.shared.mean())
        stdivLBL.text = String(format: "%.1f",Guesser.shared.stdDiv())
        // Do any additional setup after loading the view.
    }//end of viewDidLoad method
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//end of class
