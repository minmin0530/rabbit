//
//  ViewController.swift
//  Rabbit
//
//  Created by Yoshiki Izumi on 2020/09/19.
//

import UIKit

class ViewController: UIViewController {

    private var rabbit = Rabbit()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rabbit.run(script: "script")
    }


}

