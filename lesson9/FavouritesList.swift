//
//  FavouritesList.swift
//  lesson9
//
//  Created by Mankiran kaur on 2017-12-04.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import Foundation
import UIKit

class FavouritesList{
    static let sharedFavouritesList = FavouritesList()
    private(set) var favourites:[String]
    
    //constructor
    init(){
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
        
    }
    
    
    func addFavourite(fontName:String){
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    func saveFavourites(){
        
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey:"favourites")
        defaults.synchronize()
    }
    
    func RemoveFavourite(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
}
