//
//  Item.swift
//  ToDoList
//
//  Created by Chloe Fermanis on 13/5/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    
    //var parentCategory = LinkingObjects(fromType: Category.self, property: "itmes")
    
}
