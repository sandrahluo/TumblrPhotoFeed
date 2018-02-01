//
//  UserViewController.swift
//  TumblrPhotoFeed
//
//  Created by Sandra Luo on 1/31/18.
//  Copyright © 2018 Sandra Luo. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //reference for your table
    @IBOutlet weak var PhotoTable: UITableView!
    // creating an array of dictionaries to store posts; initialize to empty array
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // TODO: Get the posts and store in posts property
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String:Any]]
                
                // TODO: Reload the table view
            
            }
        }
        //configure the datasource and delegate of table view
        
        PhotoTable.delegate = self
        PhotoTable.dataSource = self
        task.resume()
    }
    
    // set the number of rows for the table view and to return the cell for each row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
        
        // Configure YourCustomCell using the outlets that you've defined.
        
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
