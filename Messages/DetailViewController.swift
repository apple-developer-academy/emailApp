//
//  DetailViewController.swift
//  Messages
//
//  Created by Rafael Moura on 26/09/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var message: Message?
    

    func configureView() {
        // Update the user interface for the detail item.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.row == 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "SenderCell", for: indexPath) as! SenderCell
            (cell as! SenderCell).senderNameLabel.text = message?.sender
            
        }else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
            (cell as! SubjectCell).subjectLabel.text = message?.subject
            
        } else {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "MessageTextCell", for: indexPath) as! MessageTextCell
            (cell as! MessageTextCell).messageTextLabel.text = message?.text
        }
        
        return cell
    }
}

