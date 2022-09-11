//
//  ViewController.swift
//  SampleApp
//
//  Created by yuutoku kouno on 2022/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BtnSearch: UIButton!
    @IBOutlet weak var BtnSecondView: UIButton!
    let vc = SecondViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.modalPresentationStyle = .fullScreen
        
    }
    
    func madeImage(){
        
    }
    @IBAction func goSecondView(_ sender: Any) {
        self.performSegue(withIdentifier: "Second", sender: nil)
     
    }
    
    
    @IBAction func searchLive(_ sender: Any) {
        var dateLive = ""
        
    }
    

}

