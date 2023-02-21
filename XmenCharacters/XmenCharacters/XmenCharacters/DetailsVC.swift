//
//  DetailsVC.swift
//  XmenCharacters
//
//  Created by Onur Ozfuttu on 21.02.2023.
//

import UIKit

// Second viewcontroller that works synchronously through the segue of each object on the main viewcontroller. After the data prepared through Preparesegue is transferred to the variable here, it provides the view as prepared in the model.

class DetailsVC: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var selectedXmen: Xmen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.image = selectedXmen?.image
        nameLabel.text = selectedXmen?.name
        infoLabel.text = selectedXmen?.info
        
    }

}
