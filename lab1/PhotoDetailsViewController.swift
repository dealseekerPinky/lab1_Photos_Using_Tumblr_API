//
//  PhotoDetailsViewController.swift
//  lab1
//
//  Created by Pinky Kohsuwan on 2/6/18.
//  Copyright © 2018 Pinky Kohsuwan. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {
    
    var url : URL?
    var image: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // check if the URL is empty or null
        if(url != nil){
        imageView.af_setImage(withURL: url!)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
