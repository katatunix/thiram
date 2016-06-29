//
//  ViewController.swift
//  thiram
//
//  Created by Nghia Bui Van on 6/28/16.
//  Copyright © 2016 Nghia Bui Van. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet var imageView: NSImageView!
	
	static var instance: ViewController?
	
	let folder = Folder()
	
	func openFile(filepath: String) {
		folder.openFile(filepath)
		refreshImage()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		ViewController.instance = self
		//openFile("/Volumes/KATA/Pictures/Music Cover Arts/1.jpg")
	}
	
	let LEFT_CODE: UInt16 = 123
	let RIGHT_CODE: UInt16 = 124
	
	override func keyUp(theEvent: NSEvent) {
		if (theEvent.keyCode == LEFT_CODE) {
			folder.prev()
			refreshImage()
		} else if (theEvent.keyCode == RIGHT_CODE) {
			folder.next()
			refreshImage()
		}
	}
	
	func refreshImage() {
		if let path = folder.curFilePath(), let image = loadImage(path) {
			imageView.image = image
			updateWinTitle()
			imageView.setNeedsDisplay()
		}
	}
	
	func loadImage(path: String) -> NSImage? {
		let imageReps = NSBitmapImageRep.imageRepsWithContentsOfFile(path)
		if imageReps == nil {
			return nil
		}
		var width = 0
		var height = 0
		for imageRep: NSImageRep in imageReps! {
			if imageRep.pixelsWide > width {
				width = imageRep.pixelsWide
			}
			if imageRep.pixelsHigh > height {
				height = imageRep.pixelsHigh
			}
		}
		let image = NSImage(size: NSMakeSize(CGFloat(width), CGFloat(height)))
		image.addRepresentations(imageReps!)
		return image
	}
	
	func updateWinTitle() {
		let idx = folder.curIdx()
		let num = folder.numFiles()
		if let filename = folder.curFileName() {
			let title = String.init(format: "[%d/%d] %@", idx, num, filename)
			self.view.window?.title = title
		}
	}
	
}
