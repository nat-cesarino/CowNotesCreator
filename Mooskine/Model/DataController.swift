//
//  DataController.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//  Copyright © 2023 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer

    // Access the persistent context
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Initialize the persistent container (the one that setups the stack)
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }

    // Load the persistent store, passing a function to get called after loading the store
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
}
