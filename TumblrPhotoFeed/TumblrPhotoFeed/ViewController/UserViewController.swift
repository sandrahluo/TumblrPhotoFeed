//
//  UserViewController.swift
//  TumblrPhotoFeed
//
//  Created by Sandra Luo on 1/31/18.
//  Copyright © 2018 Sandra Luo. All rights reserved.
//

import UIKit
import AlamofireImage

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // creating an array of dictionaries to store posts; initialize to empty array
    var posts: [[String: Any]] = []
    @IBOutlet weak var PhotoTable: UITableView!
    
    var rowHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoTable.delegate = self
        PhotoTable.dataSource = self

        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 1)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        //print("request \(request)")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            print("inside task")
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String:Any]]
                let post = self.posts.first!
                if let photos = post["photos"] as? [[String: Any]] {
                    // photos is NOT nil, we can use it!
                    // TODO: Get the photo url
                    
                    let photo = photos[0]
                    let originalSize = photo["original_size"] as! [String: Any]
                    let height = originalSize["height"] as! CGFloat
                    let width = originalSize["width"] as! CGFloat
                    let ratio = height/width
                    
                    let screenWidth = self.PhotoTable.frame.width
                    self.rowHeight = screenWidth*ratio
                }
                
                // TODO: Reload the table view
                self.PhotoTable.reloadData()
                
            }
        }
        //configure the datasource and delegate of table view
        
        
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    // set the number of rows for the table view and to return the cell for each row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
        
        // Configure YourCustomCell using the outlets that you've defined
        let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            
            
            cell.photoImage.af_setImage(withURL: url!, completion:
                { _ in
                    let newFrame = CGRect(x: 0, y: 0,
                                          width: cell.frame.width, height: cell.frame.height)
                    cell.photoImage.frame = newFrame
                })
            
        }
        
        return cell
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
