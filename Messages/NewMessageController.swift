//
//  NewMessageController.swift
//  Messages
//
//  Created by Rafael Moura on 26/09/16.
//  Copyright © 2016 Rafael Moura. All rights reserved.
//

import UIKit

class NewMessageController: UIViewController {

    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var senderField: UITextField!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: UIBarButtonItem) {
        
        guard let sender = senderField.text, !sender.isEmpty else {
            return
        }
        
        guard let subject = subjectField.text, !subject.isEmpty else {
            return
        }
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        Message.createMessageWithSender(sender: sender, subject: subject, text: text) { (message) in
            
            if let message = message {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
