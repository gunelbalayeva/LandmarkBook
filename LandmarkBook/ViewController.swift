//
//  ViewController.swift
//  LandmarkBook
//
//  Created by User on 16.02.25.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tabelView: UITableView!
    var landmarkNames = [String]()
    var images = [UIImage?]()
     
    var choosenlandmarkName = " "
    var choosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self

        landmarkNames.append("Yunanistan")
        landmarkNames.append("Islandiya")
        landmarkNames.append("Gurcustan")
        landmarkNames.append("Ispaniya")
        landmarkNames.append("Italiya")
        
        images.append(UIImage(named: "yunanistan"))
        images.append(UIImage(named: "islandiya"))
        images.append(UIImage(named: "Gurcustan"))
        images.append(UIImage(named: "ispaniya-barcelona"))
        images.append(UIImage(named: "italiya"))

        
    }
    //nece dene gosterim?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    // ne gosterim?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.secondaryText = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenlandmarkName = landmarkNames[indexPath.row]
        choosenLandmarkImage = images[indexPath.row] ?? UIImage()
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedName = choosenlandmarkName
            destinationVC.selectedImage = choosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}












