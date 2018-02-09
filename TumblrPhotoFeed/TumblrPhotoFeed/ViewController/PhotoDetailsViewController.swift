//
//  PhotoDetailsViewController.swift
//  TumblrPhotoFeed
//
//  Created by Sandra Luo on 2/8/18.
//  Copyright © 2018 Sandra Luo. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {
    
    var photoURL: URL?
    @IBOutlet weak var PhotoDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if photoURL != nil {
            PhotoDetail.af_setImage(withURL: photoURL!)
            // Do any additional setup after loading the view
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        var destinationViewController = segue.destination as! PhotoDetailsViewController
//
//        destinationViewController.image = self.imageView.image
//
//        let vc = segue.destination as! PhotoDetailsViewController
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        // set the photo property of the PhotoDetailsViewController
//        tableView:didSelectRowAtIndexPath
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 0
//    }
//
//    class PhotoViewController : UIViewController {
//        var image: UIImage!
//    }
//
}

