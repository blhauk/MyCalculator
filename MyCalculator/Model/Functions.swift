//
//  Functions.swift
//  MyCalculator
//
//  Created by Blair Haukedal on 2020-03-13.
//  Copyright © 2020 blhauk. All rights reserved.
//

import Foundation
func roundResult(_  result: Double) -> String {
    //FIXME: round and remove trailing zeros

    let maxDigits = 20 //including decimal

    let resultInt = Int(result)
    let resultFrac = result - Double(resultInt)

    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal

    let formattedInt = numberFormatter.string(from: NSNumber(value: resultInt))
    print("formattedInt: \(formattedInt!)")

    let digitIntCount = formattedInt!.count
    print("formattedInt.count: \(digitIntCount)")
      
    let digitFracCount = String(maxDigits - digitIntCount - 1)  // -1 accounts for decimal
    let fmtString = "%." + digitFracCount + "f"
    print("format string: \(fmtString)")
    let formattedFrac = String(format: fmtString, resultFrac)

    //TODO: remove trailing zeros
    let formattedResult = formattedInt! + formattedFrac.dropFirst() //drop decimal
    print("formattedResult: \(formattedResult)")
    print("formattedResult.count: \(formattedResult.count)")
    return  formattedResult
}
