//
//  Folder.swift
//  thiram
//
//  Created by Nghia Bui Van on 6/28/16.
//  Copyright © 2016 Nghia Bui Van. All rights reserved.
//

import Foundation

class Folder {
	
	var idx = -1
	var files: [String] = []
	var folderPath: String?
	
	func openFile(filePath: String) {
		idx = -1
		files.removeAll()
		folderPath = nil
		
		if let rangeOfSlashes = filePath.rangeOfString("/", options: NSStringCompareOptions.BackwardsSearch) {
			folderPath = String(filePath.characters.prefixUpTo(rangeOfSlashes.endIndex))
		}
		if folderPath == nil {
			return
		}
		
		var allFiles: [String]
		let fileManager = NSFileManager.defaultManager()
		do {
			allFiles = try fileManager.contentsOfDirectoryAtPath(folderPath!)
		} catch {
			return
		}
		
		for file in allFiles {
			if isImageFile(file) && fileManager.isReadableFileAtPath(folderPath! + file) {
				files.append(file)
			}
		}
		
		files.sortInPlace()
		idx = 0
		for i in 0 ... files.count - 1 {
			if folderPath! + files[i] == filePath {
				idx = i
				break
			}
		}
	}
	
	func isImageFile(name: String) -> Bool {
		let lower = name.lowercaseString
		let extList = [".jpg", ".jpeg", ".png", ".tga", ".bmp", ".gif"]
		for ext in extList {
			if lower.hasSuffix(ext) {
				return true
			}
		}
		return false
	}
	
	func numFiles() -> Int {
		return files.count
	}
	
	func next() {
		if idx < numFiles() - 1 {
			idx = idx + 1
		}
	}
	
	func prev() {
		if (idx > 0) {
			idx = idx - 1
		}
	}
	
	func curIdx() -> Int {
		return idx + 1
	}
	
	func curFileName() -> String? {
		return numFiles() == 0 ? nil : files[idx]
	}
	
	func curFilePath() -> String? {
		return numFiles() == 0 ? nil : folderPath! + files[idx]
	}
	
}
