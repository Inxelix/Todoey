//
//  Category.swift
//  Todoey
//
//  Created by Артем Загоскин on 02/04/2019.
//  Copyright © 2019 Tyoma Zagoskin. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()
}
