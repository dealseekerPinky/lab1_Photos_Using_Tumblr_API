//
//  PhotoViewController.swift
//  lab1
//
//  Created by Pinky Kohsuwan on 2/4/18.
//  Copyright © 2018 Pinky Kohsuwan. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var posts: [[String: Any]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]] {

        // 1.
        let photo = photos[0]
        // 2.
        let originalSize = photo["original_size"] as! [String: Any]
        // 3.
        let urlString = originalSize["url"] as! String
        // 4.
        let url = URL(string: urlString)
        
        cell.PhotoCell.af_setImage(withURL: url!)
        
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! PhotoDetailsViewController
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)!
        let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]] {
            
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
        destinationViewController.url = url
        
        //cell.selectionStyle = UITableViewCellSelectionStyle.none
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 200
 
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        
                // TODO: Get the posts and store in posts property
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
               
                // TODO: Reload the table view
                self.tableView.reloadData()

            }
        }
        task.resume()
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
