//
//  Item.swift
//  Todoey
//
//  Created by Артем Загоскин on 02/04/2019.
//  Copyright © 2019 Tyoma Zagoskin. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
