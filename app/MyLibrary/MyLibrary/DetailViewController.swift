//
//  DetailViewController.swift
//  MyLibrary
//
//  Created by Mastere 1 IT on 21/06/2016.
//  Copyright © 2016 triforce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var detailItem: AnyObject? {
        didSet {
            
        }
    }

    func configureView() {
        //self.detailItem me renvoie une optional
        //uste au dessus
        if let detail: AnyObject = self.detailItem{
            let book = detail as! Book
            titleLabel.text = book.title
            authorLabel.text = book.author
            descriptionTextView.text = book.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

