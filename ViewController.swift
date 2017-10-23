//
//  ViewController.swift
//  testeAnimacao
//
//  Created by Gabriel Maia Vinagre Costa on 22/10/17.
//  Copyright © 2017 gabrielVinagre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttaoAnimacao(_ sender: UIButton) {
        ViewAnimada.addSuccessAnimation{
        (finished) -> Void in
            
          print("animation done")
        }
    }
    @IBOutlet weak var ViewAnimada: SucessAlert!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

