//
//  Util.swift
//  SwiftyChrono
//
//  Created by Jerry Chen on 1/18/17.
//  Copyright © 2017 Potix. All rights reserved.
//

import Foundation

/// get ascending order from two number.
/// ATTENSION:
func sortTwoNumbers(_ index1: Int, _ index2: Int) -> (lessNumber: Int, greaterNumber: Int) {
    if index1 == index2 {
        return (index1, index2)
    }
    
    let lessNumber = index1 < index2 ? index1 : index2
    let greaterNumber = index1 > index2 ? index1 : index2
    return (lessNumber, greaterNumber)
}

extension NSTextCheckingResult {
    func isNotEmpty(atRangeIndex index: Int) -> Bool {
        return rangeAt(index).length != 0
    }
    
    func isEmpty(atRangeIndex index: Int) -> Bool {
        return rangeAt(index).length == 0
    }
    
    func string(from text: String, atRangeIndex index: Int) -> String {
        return text.subString(with: rangeAt(index))
    }
}

extension String {
    func subString(with range: NSRange) -> String {
        return (self as NSString).substring(with: range)
    }
    
    func substring(from idx: Int) -> String {
        return substring(from: index(startIndex, offsetBy: idx))
    }
    
    func substring(from startIdx: Int, to endIdx: Int? = nil) -> String {
        if startIdx < 0 || (endIdx != nil && endIdx! < 0) {
            return ""
        }
        let start = characters.index(startIndex, offsetBy: startIdx)
        let end = endIdx != nil ? characters.index(startIndex, offsetBy: endIdx!) : endIndex
        return substring(with: start..<end)
    }
    
    func range(ofStartIndex idx: Int, length: Int) -> Range<String.Index> {
        let startIndex0 = index(startIndex, offsetBy: idx)
        let endIndex0 = index(startIndex, offsetBy: idx + length)
        return Range(uncheckedBounds: (lower: startIndex0, upper: endIndex0))
    }
    
    func range(ofStartIndex startIdx: Int, andEndIndex endIdx: Int) -> Range<String.Index> {
        let startIndex0 = index(startIndex, offsetBy: startIdx)
        let endIndex0 = index(startIndex, offsetBy: endIdx)
        return Range(uncheckedBounds: (lower: startIndex0, upper: endIndex0))
    }
    
    func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension NSRegularExpression {
    static func isMatch(forPattern pattern: String, in text: String) -> Bool {
        return (try? NSRegularExpression(pattern: pattern, options: .caseInsensitive))?.firstMatch(in: text, range: NSRange(location: 0, length: text.characters.count)) != nil
    }
}
