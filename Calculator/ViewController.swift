//
//  ViewController.swift
//  Calculator
//
//  Created by Krishna Venkatramani on 2/1/20.
//  Copyright © 2020 Team Krish. All rights reserved.
//

import UIKit

func compute_function (tag:String,x:Float,y:Float) -> Float{
    switch tag{
    case "sum" :
        return Float(x+y)
    case "subtract":
        return Float(x-y)
    case "divide":
        return Float(x/y)
    case "multiply":
        return Float(x*y)
    default:
        return 0
    }
}

func check_operators(numbers:Array<Float>,operators:Array<String>) -> (Float,Bool){
    if(numbers.count>=2 && operators.count>=1){
        let result = compute_function(tag: operators[operators.count-1], x: numbers[numbers.count-2], y: numbers[numbers.count-1])
        return (result,true)
    }
    else{
        return(0,false)
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var numbers : [Float] = [];
    var operators : [String] = [];
    var condition: Bool = false
    
    func cmp(){
        let present_num = Float(Calc_label.text!)!
        if (!numbers.contains(present_num) && present_num > 0.0){
            numbers.append(present_num)
        }
        print("The numbers looks like this right now \(numbers)")
        print("The number of operators looks like this right now \(operators)")
        let (result_value,condition) = check_operators(numbers: numbers, operators: operators)
        if (condition){
            numbers.removeLast(2)
            print("Before appending the result \(numbers)")
            numbers.append(result_value)
            print("After appending the result \(numbers)")
            operators.removeLast()
            Calc_label.text = String(result_value)
        }
        else{
            Calc_label.text = "0"
        }
    }
    
    
    @IBOutlet weak var Calc_label: UILabel!
    
    @IBAction func Clear(_ sender: UIButton) {
        numbers = []
        operators = []
        Calc_label.text = "0";
        
    }
     
    @IBAction func Operations(_ sender: UIButton) {
        switch sender.tag{
            case 0:
                print("modulus")
                operators.append("modulus")
                break;
            case 1:
                print("sign")
                operators.append("sign")
                cmp()
                break;
            case 2:
                print("sum")
                operators.append("sum")
                cmp()
                break;
            case 3:
                print("subract")
                operators.append("subtract")
                cmp()
                break;
            case 4:
                print("divide")
                operators.append("divide")
                cmp()
                break;
            case 5:
                print("multiply")
                operators.append("multiply")
                cmp()
                break;
            case 6:
                print("Equating")
                cmp()
                break;
            default:
                print("there was nothing that matched the tags:/")
                break;
                
        }
    }
    
    @IBAction func number(_ sender: UIButton) {
        print("The number clicked was \(sender.tag)!")
        Calc_label.text = (Calc_label.text! == "0") ? String(sender.tag) : (Calc_label.text ?? "Lol")+String(sender.tag);
    }
    
}


