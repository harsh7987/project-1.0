//
//  ViewController.swift
//  project 1.0
//
//  Created by Pranjal Verma on 28/05/24.
//

import UIKit

class ViewController: UITableViewController {

  var pictures = [String]()
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Strom Viewer"
    
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    // Do any additional setup after loading the view.
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let item = try! fm.contentsOfDirectory(atPath: path)
    
    for item in item {
      if item.contains("nssl") {
        pictures.append(item)
        pictures.sort()
      }
    }
    
    print(pictures)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pictures.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(pictures.count)"
    
    print(pictures.count)
    print(indexPath.row)
    return cell
  }
  
//   didselecteRowAt for extract detailViewController from storyboard with using instantiateViewController with indetifire and load the images in selected image
//   The main purpose of this is to load images in our 2nd detailViewController 
  // Commite From Remote
  // commit from mac
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController  {
      // This as? meaning “please try to treat this as a DetailViewController, but if it fails then do nothing and move on.”
      vc.selectedImage = pictures[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  @objc func shareTapped() {
    let text = "Check this awsome APP"
    
    let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
    
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    
    present(vc, animated: true)
    
  }

}

