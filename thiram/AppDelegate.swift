//
//  AppDelegate.swift
//  thiram
//
//  Created by Nghia Bui Van on 6/28/16.
//  Copyright © 2016 Nghia Bui Van. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
		return true
	}
	
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		// Insert code here to initialize your application
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}
	
	func application(sender: NSApplication, openFile filename: String) -> Bool {
		if let vc = ViewController.instance {
			vc.openFile(filename)
		}
		return true
	}
	
}
