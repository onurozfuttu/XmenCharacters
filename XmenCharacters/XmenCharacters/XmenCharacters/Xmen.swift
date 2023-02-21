//
//  Xmen.swift
//  XmenCharacters
//
//  Created by Onur Ozfuttu on 21.02.2023.
//

import Foundation
import UIKit

//Instead of manually preparing the information to be shared one by one on a single page, a model is created and then a more organized and functional structure is established through the objects created from this model. In order for UIImage to become visible, the UIkit framework must be imported.
class Xmen {
    
    var name: String
    var image: UIImage
    var info: String
    var realName: String
    
    init(name: String, image: UIImage, info: String, realName: String){
        self.name = name
        self.image = image
        self.info = info
        self.realName = realName
    }
}
