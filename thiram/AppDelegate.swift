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
		// Insert code here to initialize your app
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your app
	}
	
	func application(sender: NSApplication, openFile filename: String) -> Bool {
		if let vc = ViewController.instance {
			vc.openFile(filename)
		}
		sender.activateIgnoringOtherApps(true)
		return true
	}
	
}
