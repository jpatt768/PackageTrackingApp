//
//  TrackerTableViewController.swift
//  PackageTrackingApp 1.0
//
//  Created by Jayden Patterson on 2021/12/16.
//

import UIKit

var packageStatusSheet: [PackageStatus] = [
    PackageStatus (name: "Jayden Patterson", address: "2-35-4 Higashi Nakano, Nakano", status: "Delivered"),
    PackageStatus (name: "Shota Kaneko", address: "2-35-4 Higashi Nakano, Nakano", status: "Distributed")
]

class TrackerTableViewController: UITableViewController {
    
    static func loadPackages() -> [PackageStatus]?  {
        return nil
    }
    static func loadSamplePackages() -> [PackageStatus] {
        let package1 = PackageStatus (name: "Jayden Patterson", address: "2-35-4 Higashi Nakano, Nakano", status: "Delivered")
        let package2 = PackageStatus (name: "Shota Kaneko", address: "2-35-4 Higashi Nakano, Nakano", status: "Distributed")
    
        return [package1, package2]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packageStatusSheet.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageStatusCell", for: indexPath) as! TrackerTableViewCell
        let packageStatus = packageStatusSheet[indexPath.row]
        cell.update(with: packageStatus)
        cell.showsReorderControl = true
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let packageStatus = packageStatusSheet[indexPath.row]
        print("\(packageStatus.name) \(indexPath)")
    }
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
        let movedPackage = packageStatusSheet.remove(at: fromIndexPath.row)
        packageStatusSheet.insert(movedPackage, at: to.row)
    }
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
