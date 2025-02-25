//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by User on 16.02.25.
//

import UIKit

class DetailsVC: UIViewController {

    
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedName = " "
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        landmarkLabel.text = selectedName
        imageView.image = selectedImage
    }
    

    
}
