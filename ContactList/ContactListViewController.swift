//
//  ContactListViewController.swift
//  ContactList
//
//  Created by DetroitLabs on 9/6/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController, AddContactViewControllerDelegate {
    func addContactViewControllerDidCancel(_ controller: AddContactViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addContactViewController(_ controller: AddContactViewController, didFinishAdding item: Contact) {
        let newRowIndex = contactsToShow.count
        contactsToShow.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    var contactsToShow: [Contact] = []
    
    
    func displayContacts() {
        let contacts = [
            ("Leeann", "Drees", "555"),
            ("Matt", "", "555")
        ]
        
        for item in contacts {
            var newContact = Contact()
            newContact.firstName = String(item.0)
            newContact.lastName = String(item.1)
            newContact.phoneNumber = String(item.2)
            contactsToShow.append(newContact)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        displayContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsToShow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        cell.textLabel?.text = "\(contactsToShow[indexPath.row].firstName) \(contactsToShow[indexPath.row].lastName)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactsToShow.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            let controller = segue.destination as! AddContactViewController
            controller.delegate = self
        }
        else if segue.identifier == "ShowContactDetail" {
            let selectedIndexPath = self.tableView.indexPathForSelectedRow!
            let row = selectedIndexPath.row
            let selectedContact = contactsToShow[row]
            if let controller = segue.destination as? ContactDetailViewController {
                controller.selectedContact = selectedContact
            }
        }
    }


}
