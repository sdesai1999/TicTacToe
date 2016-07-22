//
//  ViewController.swift
//  TicTacToe
//
//  Created by Saurav Desai on 7/21/16.
//  Copyright © 2016 Saurav Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    var diag159 : [String]!
    var diag753 : [String]!
    var horiz123 : [String]!
    var horiz456 : [String]!
    var horiz789 : [String]!
    var vert147 : [String]!
    var vert258 : [String]!
    var vert369 : [String]!
    var winningMethods : [[String]]! = []
    var isX : Bool = true
    var moveCount : Int = 0
    // var labelArray : [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diag159 = [label1.text!, label5.text!, label9.text!]
        diag753 = [label7.text!, label5.text!, label3.text!]
        horiz123 = [label1.text!, label2.text!, label3.text!]
        horiz456 = [label4.text!, label5.text!, label6.text!]
        horiz789 = [label7.text!, label8.text!, label9.text!]
        vert147 = [label1.text!, label4.text!, label7.text!]
        vert258 = [label2.text!, label5.text!, label8.text!]
        vert369 = [label3.text!, label6.text!, label9.text!]
        winningMethods.append(diag159)//0
        winningMethods.append(diag753)//1
        winningMethods.append(horiz123)//2
        winningMethods.append(horiz456)//3
        winningMethods.append(horiz789)//4
        winningMethods.append(vert147)//5
        winningMethods.append(vert258)//6
        winningMethods.append(vert369)//7
        // labelArray = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
    }
    
    func checkForWinner(){
        for i in 0..<winningMethods.count{
            let currentStr : String = winningMethods[i][0]
            let nextStr : String = winningMethods[i][1]
            let thirdStr : String = winningMethods[i][2]
            if currentStr == nextStr && nextStr == thirdStr{
                if currentStr == "X" || currentStr == "O"{
                    alertMessageWinner(currentStr)
                }
            }
        }
    }
    
    func printXOrO(label : UILabel!){
        if isX == true{
            label.text! = "X"
            isX = false
        }
        else{
            label.text! = "O"
            isX = true
        }
    }
    
    func updateMethods(){
        winningMethods[0] = diag159
        winningMethods[1] = diag753
        winningMethods[2] = horiz123
        winningMethods[3] = horiz456
        winningMethods[4] = horiz789
        winningMethods[5] = vert147
        winningMethods[6] = vert258
        winningMethods[7] = vert369
    }
    
    func reNew(){
        //reload application data (renew root view )
        UIApplication.sharedApplication().keyWindow?.rootViewController = storyboard!.instantiateViewControllerWithIdentifier("Root_View")
    }
    
    func alertMessageWinner(value : String){
        let message = "\(value) is the winner!"
        let alert = UIAlertController(title: "Game Finished", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Reset", style: .Destructive, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        isX = true
        reNew()
    }
    
    func alertMessageTie(){
        let message = "Tie"
        let alert = UIAlertController(title: "Cat's Game", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Reset", style: .Destructive, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        isX = true
        reNew()
    }
    
    func checkForDraw() {
        if moveCount == 9{
            alertMessageTie()
        }
    }
    
    @IBAction func onTappedLabel1(sender: UITapGestureRecognizer) {
        if label1.text! != "X" && label1.text! != "O"{
            printXOrO(label1)
            diag159[0] = label1.text!
            horiz123[0] = label1.text!
            vert147[0] = label1.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel2(sender: UITapGestureRecognizer) {
        if label2.text! != "X" && label2.text! != "O"{
            printXOrO(label2)
            horiz123[1] = label2.text!
            vert258[0] = label2.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel3(sender: UITapGestureRecognizer) {
        if label3.text! != "X" && label3.text! != "O"{
            printXOrO(label3)
            diag753[2] = label3.text!
            horiz123[2] = label3.text!
            vert369[0] = label3.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel4(sender: UITapGestureRecognizer) {
        if label4.text! != "X" && label4.text! != "O"{
            printXOrO(label4)
            horiz456[0] = label4.text!
            vert147[1] = label4.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel5(sender: UITapGestureRecognizer) {
        if label5.text! != "X" && label5.text! != "O"{
            printXOrO(label5)
            horiz456[1] = label5.text!
            vert258[1] = label5.text!
            diag159[1] = label5.text!
            diag753[1] = label5.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel6(sender: UITapGestureRecognizer) {
        if label6.text! != "X" && label6.text! != "O"{
            printXOrO(label6)
            horiz456[2] = label6.text!
            vert369[1] = label6.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel7(sender: UITapGestureRecognizer) {
        if label7.text! != "X" && label7.text! != "O"{
            printXOrO(label7)
            horiz789[0] = label7.text!
            vert147[2] = label7.text!
            diag753[0] = label7.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel8(sender: UITapGestureRecognizer) {
        if label8.text! != "X" && label8.text! != "O"{
            printXOrO(label8)
            horiz789[1] = label8.text!
            vert258[2] = label8.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
    
    @IBAction func onTappedLabel9(sender: UITapGestureRecognizer) {
        if label9.text! != "X" && label9.text! != "O"{
            printXOrO(label9)
            diag159[2] = label9.text!
            horiz789[2] = label9.text!
            vert369[2] = label9.text!
            moveCount += 1
            updateMethods()
            checkForDraw()
            checkForWinner()
        }
    }
}


























