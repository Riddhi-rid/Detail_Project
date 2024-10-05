//
//  DetailVC.swift
//  PracticeTable
//
//  Created by admin on 05/10/24.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    
    
    var selectedJoke : JokeModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.text = selectedJoke.setup
        lbl2.text = selectedJoke.punchline
        lbl3.text = selectedJoke.type
        
    }

}
