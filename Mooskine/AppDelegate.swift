//
//  AppDelegate.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Instantiate our data controller
    let dataController = DataController(modelName: "Mooskine")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        dataController.load()

        // Inject data controller dependency into Notebooks List View Controller
        let navigationController = window?.rootViewController as! UINavigationController
        let notebooksListViewController = navigationController.topViewController as! NotebooksListViewController
        notebooksListViewController.dataController = dataController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveViewContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveViewContext()
    }

    func saveViewContext() {
        try? dataController.viewContext.save()
    }
}

