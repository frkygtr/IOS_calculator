//
//  viewModel.swift
//  calculator1
//
//  Created by Furkan Yiğiter on 30.06.2022.
//

import Foundation

class calculatorViewModel {
    
    var workings: String = ""
    
    var firstValue : Int = 0
    var secondValue : Int = 0
    
    var secondStartIndex : Int = 0
    
    var result : Int = 0
    var subString : String.Index?
    
    var flag : calculatorFlag = .none
    
    enum calculatorFlag : Int{
        case none,
        divedeFlag,
        multipleFlag,
        extractionFlag,
        sumFlag
    }
    
    enum buttonInput : Int {
    case zero = 0,
        one,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        clean,
        delete,
        divide,
        multiple,
        extraction,
        sum,
        result
    }
    
    
    
    
}
