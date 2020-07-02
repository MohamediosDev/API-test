//
//  ViewController.swift
//  API TEST
//
//  Created by Mohamed on 7/2/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var caseslb: UILabel!
    
    @IBOutlet weak var deathlabel: UILabel!
    
    @IBOutlet weak var countrylb: UILabel!
    
    @IBOutlet weak var cirtiacllb: UILabel!
    
    @IBOutlet weak var imagevieww: UIImageView!
    
    
    
//MARK:- API
  let Api = "https://coronavirus-19-api.herokuapp.com/countries/USA"
    let Api2 = "https://dog.ceo/api/breeds/image/random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARK:- Get CoronaData
        fetchdata(url: Api, response: APIclass.self) { (response) in
            
            switch response {
            case .success(let APIcall):
                self.caseslb.text! = "CASES :  \((APIcall!.cases))"
                self.deathlabel.text! = "Deathes:  \((APIcall!.deaths))"
                self.countrylb.text! = "Country Name:   \((APIcall!.country))"
                self.cirtiacllb.text! = "Critiacl :  \((APIcall!.critical))"
                
            case .failure(_):
                print("Error")
                           }
            
//MARK:- Get API image data
            
            fetchdata(url: self.Api2, response:DOG.self) { (response) in
                switch response {
                case .success(let imageapi):
                    
             self.imagevieww.sd_setImage(with: imageapi?.message, completed: nil)
                    
                case .failure(_):
                    print("ERRor")
                }
            }
        }
    }
}



//MARK:- Func fetch data form any API

    func fetchdata<T:Decodable>(url: String, response:T.Type ,completion:@escaping (Result<T?, NSError>) -> Void) {
        
        AF.request(url, method: .get , parameters: [:], headers: [:] ).responseJSON { (response) in
            guard let status = response.response?.statusCode else {return}
            
            if status == 200 {//the is api
             guard let jsonResponse = try? response.result.get() else { return }
            guard let JsonData = try? JSONSerialization.data(withJSONObject: jsonResponse , options: []) else {return}
                
                guard let responseobj = try? JSONDecoder().decode(T.self, from: JsonData) else {return}
                completion(.success(responseobj))
                
                }
            }
        }
        
    
    





