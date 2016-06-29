//
//  MainWin.swift
//  thiram
//
//  Created by Nghia Bui Van on 6/28/16.
//  Copyright © 2016 Nghia Bui Van. All rights reserved.
//

import Foundation
import Cocoa

class MainWin : NSWindow {
	
	override func keyUp(theEvent: NSEvent) {
		super.keyUp(theEvent)
		self.contentViewController?.keyUp(theEvent);
    }
	
	override func performKeyEquivalent(theEvent: NSEvent) -> Bool {
		return true
	}
	
}
