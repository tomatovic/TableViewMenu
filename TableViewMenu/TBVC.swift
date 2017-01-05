//
//  TBVC.swift
//  TableViewMenu
//
//  Created by Thomas on 16.12.16.
//  Copyright © 2016 Thomas Hirth. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var nameMenu = [String] ()
    var identities = [String] ()
    

    func performListshortcutViewA() {
      performSegue(withIdentifier: "ViewA", sender: self)
    }
 
    func performListshortcutViewB() {
        performSegue(withIdentifier: "ViewB", sender: self)
    }

    
    
    override func viewDidLoad() {
        
        nameMenu = ["Aperture", "Shutter", "ISO", "SD-Card"]
        identities = ["A", "B", "C","D"]
        
        let icon1 = UIApplicationShortcutIcon(type: .add)
        let icon2 = UIApplicationShortcutIcon(type: .love)
        let icon3 = UIApplicationShortcutIcon(type: .bookmark)
        
        let item1 = UIApplicationShortcutItem(type: "de.thomashirth.play", localizedTitle: "Abspielen", localizedSubtitle: "get the play", icon: icon1, userInfo: nil)
        let item2 = UIApplicationShortcutItem(type: "de.thomashirth.pause", localizedTitle: "Pause", localizedSubtitle: "get the pause", icon: icon2, userInfo: nil)
        let item3 = UIApplicationShortcutItem(type: "de.thomashirth.rewind", localizedTitle: "Add", localizedSubtitle: "get the add", icon: icon3, userInfo: nil)

        
        UIApplication.shared.shortcutItems = [item1, item2, item3]
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameMenu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel!.text = nameMenu [indexPath.row]
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
 
    
}
