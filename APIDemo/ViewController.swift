//
//  ViewController.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 19/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callJokes()
    }
    
    // Here Call Jokes Api
    
    func callJokes(){
        callJokeAPI { res in
            switch res {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }


}

