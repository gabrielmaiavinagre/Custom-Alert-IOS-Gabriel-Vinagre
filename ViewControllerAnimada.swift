//
//  ViewControllerAnimadaViewController.swift
//  testeAnimacao
//
//  Created by Gabriel Maia Vinagre Costa on 22/10/17.
//  Copyright © 2017 gabrielVinagre. All rights reserved.
//

import UIKit

class ViewControllerAnimada: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.darkGray
        
//        frame: CGRect(x: 10, y: 10, width: 300, height: 300),
        
        var view = CustomAlert( type: AlertsType.success, title: "Success", message: "Olá")
        
        
        
        
        self.view.addSubview(view)
        view.display_alert()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
