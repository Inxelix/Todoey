//
//  AppDelegate.swift
//  Todoey
//
//  Created by Артем Загоскин on 29/03/2019.
//  Copyright © 2019 Tyoma Zagoskin. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Realm error: \(error)")
        }
        
        return true
    }

}

