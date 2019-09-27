//
//  OSCountryPicker.swift
//  OSCountryPicker
//
//  Created by apple on 27/09/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

public class OSCountryPicker: NSObject {
    
    static var picker : UIViewController{
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "SelectCountryViewController")as! SelectCountryViewController
        return vc
    }
    
    public override init() {
        super.init()
    }

}
