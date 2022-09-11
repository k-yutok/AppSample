//
//  ViewController.swift
//  SampleApp
//
//  Created by yuutoku kouno on 2022/09/11.
//

import UIKit
import Foundation
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var BtnSearch: UIButton!
    @IBOutlet weak var BtnSecondView: UIButton!
    
    @IBOutlet weak var txtSearchLive: UITextField!
    @IBOutlet weak var txtLiveinfomaition: UILabel!
    @IBOutlet weak var BtnAddLive: UIButton!
    @IBOutlet weak var TxtLiveInfo: UILabel!

    let realm = try! Realm()
    let vc = SecondViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtInit()
        self.makedb()
        
        vc.modalPresentationStyle = .fullScreen
        TxtLiveInfo.text = ""

        self.save()
    }
    
    func txtInit(){
        txtLiveinfomaition.font = .systemFont(ofSize: 23)
    }
    
    func makedb(){
        // 1番目のライブ
        let realmData1 = RealmLive()
        realmData1.id = 1
        realmData1.name = "FirstLive"
        realmData1.age = 10
        
        // 2番目のライブ
        let realmData2 = RealmLive()
        realmData2.id = 2
        realmData2.name = "secondLive"
        realmData2.age = 11
        
        // 3番目のライブ
        let realmData3 = RealmLive()
        realmData3.id = 3
        realmData3.name = "thirdLive"
        realmData3.age = 12
        
        let lives = List<RealmLive>()
        lives.append(realmData1)
        lives.append(realmData2)
        lives.append(realmData3)
       
        try! realm.write{
            realm.add(lives)
        }
        
    }
    
    func save(){
        do {
            let realm = try Realm()
            try realm.write {
            //    realm.add(self.realmData)
                
            }
        } catch {
            print("catch")
        }
    }
    
    @IBAction func goSecondView(_ sender: Any) {
        self.performSegue(withIdentifier: "Second", sender: nil)
     
    }
    @IBAction func doAddLive(_ sender: Any) {
       

     //   self.save()
    }
    
    
    @IBAction func searchLive(_ sender: Any) {
        let s = txtSearchLive.text!
        let txt = "name =='\(s)'"
   //     s = ""
        // 文字列によるクエリ
        
     //   TxtLiveInfo.text = results.name
        
    //    do {
         //   let realm = try Realm()
        let results = realm.objects(RealmLive.self).filter(txt)
        //    let results = realm.objects(RealmLive.self)
            if results.count != 0 {
                for result in results {
                    TxtLiveInfo.text = result.name
                }
            }else {
                TxtLiveInfo.text = "該当するライブがありません"
            }
     //   }catch{
            
      //  }
         
    }
    

}


class RealmLive: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name = ""
    @objc dynamic var age: Int = 0
    
}
