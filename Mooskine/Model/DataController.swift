//
//  DataController.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer

    // Access the persistent context
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var backgroundContext: NSManagedObjectContext!

    // Initialize the persistent container (the one that setups the stack)
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }

    func configureContexts() {
        backgroundContext = persistentContainer.newBackgroundContext()

        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true

        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }

    // Load the persistent store, passing a function to get called after loading the store
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            self.configureContexts()
            completion?()
        }
    }
}

extension DataController {
    func autoSaveViewContext(interval: TimeInterval = 30) {
        print("autosaving")
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }

    }
}
