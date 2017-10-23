//
//  CustomAlerts.swift
//  testeAnimacao
//
//  Created by Gabriel Maia Vinagre Costa on 22/10/17.
//  Copyright © 2017 gabrielVinagre. All rights reserved.
//

import Foundation
import UIKit

enum AlertsType{
    case success
    case error
    case loading
}

class CustomAlert: UIView {
    
    private var view_w:CGFloat?
    private var view_h:CGFloat?
    private var message:String
    private var title: UILabel
    private var type:AlertsType
    
    private var animation_view = SucessAlert()
    
    /**
     - parameters:
        - type: set the type of the alert(success, error or loading)
        - title: set the title of the alert
        - message: set the alert message
     */
    init(type:AlertsType, title:String, message:String){
        
        
        let screenSize = UIScreen.main.bounds
        self.view_w = screenSize.width
        self.view_h = screenSize.height
        
        
        let frameView = CGRect(origin: CGPoint(x:self.view_w!*0.5 - 234/2 ,y:(self.view_h! - self.view_h!*0.5)/2), size:CGSize(width: 234, height: 262))
        
        
        self.type = type
        self.message = message
        self.title = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        
        super.init(frame:frameView)
        self.title.center = CGPoint(x: Int(self.bounds.width/2), y:50)
        self.title.textAlignment = .center
        self.title.font = UIFont(name:"HelveticaNeue-Bold", size:28)
        self.title.textColor = UIColor(red: 37/255, green: 251/255, blue: 50/255, alpha: 1)
        self.title.text = title.uppercased()
        
        self.create_alert()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    private func create_alert(){
        
        self.backgroundColor = UIColor.white
        self.alpha = 0
        self.title.alpha = 0
        
        self.title.transform = self.title.transform.scaledBy(x: 0.25, y: 0.25)
        
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width:0, height:0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        
        
        if self.type == AlertsType.success{
            
            self.animation_view = SucessAlert(frame: CGRect(x: self.bounds.size.width/2-60, y: self.title.center.y+40, width: 120, height: 120))
        }
        
        UIView.animate(withDuration: 1, delay:0 , options:UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.alpha = 1.0
            
        }, completion: { finished in
            
            self.addSubview(self.title)
            
            UIView.animate(withDuration: 0.5, delay:0 , options:UIViewAnimationOptions.curveEaseInOut, animations: {
                
                self.title.alpha = 1.0
                self.title.transform = self.title.transform.scaledBy(x: 4, y: 4);
                
            }, completion: {
                finished in
                
                self.addSubview(self.animation_view)
                
            })
            
        })
    }
    
    /// Display the alert in the view
    func display_alert(){
        self.animation_view.addSuccessAnimation{
            (finished) -> Void in
            
            print("animation done")
            remove_alert()
        }
    
        func remove_alert(){
//            self.removeFromSuperview()
        }
        
    }
    
    
    
    
}
