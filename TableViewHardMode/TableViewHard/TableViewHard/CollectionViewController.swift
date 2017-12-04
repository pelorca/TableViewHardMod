//
//  CollectionViewController.swift
//  TableViewHard
//
//  Created by Aloc SP08161 on 30/11/2017.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import UIKit
import DataKit
import Photos

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var images = [UIImage]()
    let imagePicker = UIImagePickerController()
    let maxSession = 2
    let maxRow = 5
    //lazy var images: [Int: [NetworkImage]] = [:]
    var selectedIdexPath: IndexPath?? = nil
    
    
    func getImages() {
        self.images.reverse()
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        getImages()
        self.imagePicker.delegate = self
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
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImagem", for: indexPath) as! CollectionViewCell
         cell.imageCollection?.image = images[indexPath.row]
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width * 0.32
        let height = self.view.frame.height * 0.179910045
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        case UICollectionElementKindSectionHeader:
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "collectionLabel",
                                                                             for: indexPath) as! CollectionReusableView
            headerView.namSection.text = "FOTOS"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.loadImageButtonTapped))
            headerView.btnCamera.addGestureRecognizer(tapGesture)
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    

    @objc func loadImageButtonTapped() {
        imagePicker.allowsEditing = false
       
        
        let alertController = UIAlertController(title: "Escolhe uma Foto", message: "", preferredStyle: .actionSheet)
        
       
        let Cancelar = UIAlertAction(title: "Cancelar", style: .cancel) { (action:UIAlertAction!) in
            return
        }
        
        alertController.addAction(Cancelar)
        
        let cancelAction = UIAlertAction(title: "Camera", style: .default) { (action:UIAlertAction!) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            //Call another alert here
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Galeria", style: .default) { (action:UIAlertAction!) in
            self.imagePicker.sourceType = .photoLibrary;
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append(pickedImage)
            }
            
            dismiss(animated: true, completion: nil)
           getImages()
    }
 
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }



    
}
