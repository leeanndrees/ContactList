//
//  ContactDetailViewController.swift
//  ContactList
//
//  Created by DetroitLabs on 9/9/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class ContactDetailViewController: UITableViewController {
    
    var selectedContact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactDetail", for: indexPath)
        cell.textLabel?.text = selectedContact?.firstName
        return cell
    }
    
}
