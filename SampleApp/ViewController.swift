//
//  ViewController.swift
//  SampleApp
//
//  Created by yuutoku kouno on 2022/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BtnSecondView: UIButton!
    let vc = SecondViewController()
    let Viewstoryboard = UIStoryboard(name: "SecondView", bundle: nil)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc.modalPresentationStyle = .fullScreen
    }
    
    
    @IBAction func goSecondView(_ sender: Any) {
//        self.performSegue(withIdentifier: "SecondView", sender: nil)
        //self.present(vc,animated: true,completion: nil)
        let nextVC = Viewstoryboard.instantiateViewControllerWithIdentifier("STORYBOARD_ID_OF_VC_CLASS") as! UIViewController.navigationController!.pushViewController(vc, animated: true)
    }
    

}

