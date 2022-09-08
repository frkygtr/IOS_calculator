//
//  ViewController.swift
//  calculator1
//
//  Created by Furkan Yiğiter on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorking: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    let calculatorclass = calculatorViewModel()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearAll()
        
    }

    func clearAll(){
        calculatorclass.workings = ""
        calculatorResults.text = ""
        calculatorWorking.text = ""
    }
    


    @IBAction func AllClearTap(_ sender: UIButton) {
        let currentButton = calculatorViewModel.buttonInput(rawValue: sender.tag)!
        
        
        switch currentButton {
            
        case .zero:
            calculatorWorking.text! += "0"
        case .one:
            calculatorWorking.text! += "1"
        case .two:
            calculatorWorking.text! += "2"
        case .three:
            calculatorWorking.text! += "3"
        case .four:
            calculatorWorking.text! += "4"
        case .five:
            calculatorWorking.text! += "5"
        case .six:
            calculatorWorking.text! += "6"
        case .seven:
            calculatorWorking.text! += "7"
        case .eight:
            calculatorWorking.text! += "8"
        case .nine:
            calculatorWorking.text! += "9"
        case .clean:
            clearAll()
        case .delete:
            if calculatorWorking.text!.count != 0 {
                calculatorWorking.text?.removeLast()
            }
        case .divide:
            processOne(operatorType: "/")
            calculatorclass.flag = .divedeFlag
        case .multiple:
            processOne(operatorType: "x")
            calculatorclass.flag = .multipleFlag
        case .extraction:
            processOne(operatorType: "-")
            calculatorclass.flag = .extractionFlag
        case .sum:
            processOne(operatorType: "+")
            calculatorclass.flag = .sumFlag
        case .result:
            
            switch calculatorclass.flag {
                
            case .none:
                print("none")
            case .divedeFlag:
                processTwo()
                calculatorclass.result = calculatorclass.firstValue / calculatorclass.secondValue
            case .multipleFlag:
                processTwo()
                calculatorclass.result = calculatorclass.firstValue * calculatorclass.secondValue
            case .extractionFlag:
                processTwo()
                calculatorclass.result = calculatorclass.firstValue - calculatorclass.secondValue
            case .sumFlag:
                processTwo()
                calculatorclass.result = calculatorclass.firstValue + calculatorclass.secondValue
            }
            calculatorResults.text = String(calculatorclass.result)

        }
    }
    
    func processOne(operatorType: String) {
        calculatorclass.firstValue = Int(calculatorWorking.text!)!
        calculatorWorking.text! += operatorType
        calculatorclass.secondStartIndex = Int(calculatorWorking.text!.count)
    }
    
    func processTwo(){
        calculatorclass.subString = calculatorWorking.text?.index(calculatorWorking.text!.startIndex, offsetBy: calculatorclass.secondStartIndex)
        calculatorclass.secondValue = Int((calculatorWorking.text?.suffix(from: calculatorclass.subString!))!)!
    }
    
    
    
}

