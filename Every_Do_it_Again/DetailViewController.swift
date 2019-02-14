//
//  DetailViewController.swift
//  Every_Do_it_Again
//
//  Created by Yilei Huang on 2019-02-13.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var switchs: UISwitch!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    
    
    


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.todoDescription!.description
                
                label.text = ("title - \(String(describing: detail.title!)): Describe - \(String(describing: detail.todoDescription!)), Detail:\(detail.priorityNumber)")
                switchs.isOn = detail.isCompleted
                switchLabel.textAlignment = .center
                
            }
        }
    }
    @IBAction func completeSwitch(_ sender: UISwitch) {
        if sender.isOn == true{
            switchLabel.text = "Complete"
        }else{
            switchLabel.text = "Not Complete"
        }
        if let detail = detailItem{
            detail.isCompleted = sender.isOn
        }
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            appDelegate.saveContext()
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

