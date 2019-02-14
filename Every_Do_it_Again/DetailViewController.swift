//
//  DetailViewController.swift
//  Every_Do_it_Again
//
//  Created by Yilei Huang on 2019-02-13.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.todoDescription!.description
                
                label.text = ("\(String(describing: detail.title!)): \(String(describing: detail.todoDescription!)), P:\(detail.priorityNumber)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: ToDo? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

