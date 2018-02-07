//
//  PhotoDetailsViewController.swift
//  lab1
//
//  Created by Pinky Kohsuwan on 2/6/18.
//  Copyright © 2018 Pinky Kohsuwan. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    var url : URL?
    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            imageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
