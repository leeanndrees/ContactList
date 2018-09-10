//
//  AddContactViewController.swift
//  ContactList
//
//  Created by DetroitLabs on 9/6/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol AddContactViewControllerDelegate: class {
    func addContactViewControllerDidCancel(_ controller: AddContactViewController)
    
    func addContactViewController(_ controller: AddContactViewController, didFinishAdding item: Contact)
}


class AddContactViewController: UITableViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    weak var delegate: AddContactViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    @IBAction func cancel() {
        delegate?.addContactViewControllerDidCancel(self)
    }

    @IBAction func done() {
        var item = Contact()
        item.firstName = firstNameField.text!
        item.lastName = lastNameField.text!
        item.phoneNumber = phoneNumberField.text!
        
        delegate?.addContactViewController(self, didFinishAdding: item)
    }

}
