//
//  Category.swift
//  ToDoList
//
//  Created by Chloe Fermanis on 13/5/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    
    let items = List<Item>()
}
