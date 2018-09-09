//
//  ContactListViewController.swift
//  ContactList
//
//  Created by DetroitLabs on 9/6/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

/* Build an iOS app that stores and manages a contact list
 Your app should utilize Model-View-Controller architecture
 On the main page, your app should list each contact’s name in a table view
 The user should be able to swipe to delete items
 Your app should have a button which allows the user to add contacts to the list
 When the user clicks on a name in the table view, they should be taken to a detail page that displays the contact’s name and phone number
 BONUS: Give the user the ability to edit contact details */

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
        
        print(contactsToShow)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        displayContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsToShow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        cell.textLabel?.text = "\(contactsToShow[indexPath.row].firstName) \(contactsToShow[indexPath.row].lastName)"
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactsToShow.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        } else if editingStyle == .insert {
//             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddContact" {
            let controller = segue.destination as! AddContactViewController
            controller.delegate = self
        }
        else if segue.identifier == "ShowContactDetail" {
            let selectedContact = contactsToShow[0]
            if let controller = segue.destination as? ContactDetailViewController {
                controller.selectedContact = selectedContact
            }
        }
    }


}
