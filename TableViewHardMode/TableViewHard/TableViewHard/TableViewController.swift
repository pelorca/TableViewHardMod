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
    
    let maxSession = 5
    let maxRow = 10
    lazy var dataIcon: [Int: [Icon]] = [:]
    lazy var images: [Int: [NetworkImage]] = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.images = generateImage(maxSession,maxRow)
        self.dataIcon = generateIcons(maxSession, maxRow)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  self.dataIcon.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataIcon[section]?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath)
        guard let content = self.dataIcon[indexPath.section]?[indexPath.row] else {
            return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
        }
        
        guard let contentImages = self.images[indexPath.section]?[indexPath.row] else {
            return tableView.dequeueReusableCell(withIdentifier: "placeHolder", for: indexPath)
        }
        
        
        cell.textLabel?.text = content.name
        cell.detailTextLabel?.text = content.description
        
        cell.imageView?.image = UIImage(named: content.imageName)
        cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
        cell.imageView?.tintColor = getRandomColor()
        
        if indexPath.row % 2 != 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
            cell.imageView?.downloadImageAsync(URL(string: contentImages.link)!)
            cell.textLabel?.text = contentImages.name
            cell.detailTextLabel?.text = contentImages.description
            
        }
     
        return cell
    }
    
    
    
    
}
