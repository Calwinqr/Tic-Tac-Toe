//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Calwin on 11/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var moves: [String] = Array(repeating: "", count: 9)
    
    private var playerTurn = true
    
    @IBOutlet var btns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tap(_ sender: UIButton) {
        if sender.configuration?.baseForegroundColor == UIColor.black || sender.currentImage == nil{
            sender.setImage(UIImage(systemName: playerTurn ? "xmark" : "circle"), for: .normal)
            sender.configuration?.baseForegroundColor=UIColor(white: 1.0, alpha: 1.0)
            moves[sender.tag] = playerTurn ? "xmark" : "circle"
            checkForWin()
            playerTurn.toggle()
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        for btn in btns {
            btn.isUserInteractionEnabled = true
            btn.configuration?.baseForegroundColor=UIColor.black
        }
        moves = Array(repeating: "", count: 9)
    }
    
    func checkForWin(){
        let winSituations = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
        for situation in winSituations{
            if moves[situation[1]] != "" && moves[situation[0]] == moves[situation[1]] && moves[situation[1]] == moves[situation[2]]{
                if moves[situation[0]] == "xmark"{
                    print("X Wins")
                    for btn in btns{
                        btn.isUserInteractionEnabled = false
                    }
                }
                else{
                    print("O Wins")
                    for btn in btns{
                        btn.isUserInteractionEnabled = false
                    }
                }
            }
        }
    }
    
}

