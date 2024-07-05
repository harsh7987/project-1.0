//
//  DetailViewController.swift
//  project 1.0
//
//  Created by Pranjal Verma on 29/05/24.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet var imageView: UIImageView!
  var selectedImage: String?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    title = "View Picture"
    title = selectedImage
         navigationItem.largeTitleDisplayMode = .never

//we using let binding to unwrapse our selected images for load to imageView by using new data type called UIImage
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
 }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
