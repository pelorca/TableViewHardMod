//
//  ViewController.swift
//  TableViewHard
//
//  Created by Aloc SP08161 on 30/11/2017.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import UIKit

class ViewControllerImagem: UIViewController, UIScrollViewDelegate {

    public var imagem: UIImage?
    @IBOutlet weak public var imagemZoom: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagemZoom.image = imagem
        //self.perfom

        // Do any additional setup after loading the view.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagemZoom
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
