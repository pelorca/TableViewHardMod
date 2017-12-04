//
//  TableViewController.swift
//  TableViewHard
//
//  Created by Eduardo Pelorca on 29/11/17.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import UIKit
import DataKit
class TableViewController: UITableViewController {
    
    let maxSession = 1
    let maxRow = 10
    lazy var dataIcon: [Int: [Icon]] = [:]
    lazy var images: [Int: [NetworkImage]] = [:]

    
    @IBOutlet var tableViewCustom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.images = generateImage(maxSession,maxRow)
        self.dataIcon = generateIcons(maxSession, maxRow)
        tableViewCustom.setEditing(true, animated: true)
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  self.images.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images[section]?.count ?? 0
    }
    
    //override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
      //  return true
    //}
    
   
    //override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> /UITableViewCellEditingStyle {
      //  return .none
    //}
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
       
        return true
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            images[indexPath.section]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var itemToMove = self.images[sourceIndexPath.section]?[sourceIndexPath.row]
        self.images[sourceIndexPath.section]?.remove(at: sourceIndexPath.row)
        self.images[sourceIndexPath.section]?.insert(itemToMove!, at: destinationIndexPath.row)
       
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! TableViewCell
        
        
        guard let content = self.images[indexPath.section]?[indexPath.row] else {
            return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
        }
        
        cell.title.text = content.name
        cell.detail.text = content.description
        cell.imageCell?.downloadImageAsync(URL(string: content.link)!)
   
     
        return cell
    }
    
    
    
    
}
