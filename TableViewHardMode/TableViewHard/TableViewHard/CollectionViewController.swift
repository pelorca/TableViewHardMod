//
//  CollectionViewController.swift
//  TableViewHard
//
//  Created by Aloc SP08161 on 30/11/2017.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import UIKit
import DataKit
private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    
    let maxSession = 2
    let maxRow = 5
    lazy var images: [Int: [NetworkImage]] = [:]
    var selectedIdexPath: IndexPath?? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.images = generateImage(maxSession,maxRow)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIdexPath = indexPath
        self.performSegue(withIdentifier: "showImage",  sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let page: ViewControllerImagem = segue.destination as! ViewControllerImagem
        if segue.identifier == "showImage" {
            page.imagem = (self.collectionView?.cellForItem(at: selectedIdexPath as! IndexPath) as! CollectionViewCell).imageCollection.image
        }
       
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.images.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.images[section]?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImagem", for: indexPath) as! CollectionViewCell
        
       
        
       let content = self.images[indexPath.section]?[indexPath.row]
        cell.imageCollection?.downloadImageAsync(URL(string: (content?.link)!)!)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "collectionLabel",
                                                                             for: indexPath) as! CollectionReusableView
            headerView.namSection.text = self.images[indexPath.section]?[indexPath.row].name
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
   
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
