//
//  RootViewController.swift
//  lesson9
//
//  Created by Mankiran kaur on 2017-12-04.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    private var favouritesList: FavouritesList!
    private static let familyCell = "FamilyName"
    private static let favouritesCell = "Favourites"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyNames = (UIFont.familyNames as [String]).sorted()
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        favouritesList = FavouritesList.sharedFavouritesList
        tableView.estimatedRowHeight = cellPointSize
        
    }
    
    
    //utility method
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNames(forFamilyName: familyName).first
            
            return fontName != nil ? UIFont(name: fontName!, size: cellPointSize) : nil
            
        }
        else{
            return nil
        }
    }
    
    //data source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return favouritesList.favourites.isEmpty ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  section == 0 ? "All font families" : "My favourite fonts"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.familyCell, for: indexPath)
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
            
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
    
        }
        else{
            return tableView.dequeueReusableCell(withIdentifier: RootViewController.favouritesCell, for: indexPath)
            }
    }

    


}
