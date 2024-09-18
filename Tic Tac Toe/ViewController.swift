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
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet var btns: [UIButton]!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var topRestartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.isHidden = true
    }
    
    @IBAction func tap(_ sender: UIButton) {
        if sender.configuration?.baseForegroundColor == UIColor.black || sender.currentImage == nil{  let image = UIImage(systemName: playerTurn ? "xmark" : "circle")
            let largerImage = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 50, weight: .bold))
            sender.setImage(largerImage, for: .normal)
            sender.configuration?.baseForegroundColor = playerTurn ? UIColor.red : UIColor.green
            moves[sender.tag] = playerTurn ? "xmark" : "circle"
            topLabel.text = playerTurn ? "Player 2's turn" : "Player 1's turn"
            checkForDraw()
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
        topLabel.text = "Start!"
        restartBtn.isHidden = true
        topRestartBtn.isHidden = false
    }
    
    func checkForDraw(){
        var count = 0
        for move in moves{
            if move != ""{
                count += 1
            }
            if count == 9{
                topLabel.text = "It's a draw!"
                restartBtn.isHidden = false
                topRestartBtn.isHidden = true
            }
        }
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
                    topLabel.text = "Player 1 Wins!"
                    for btn in btns{
                        btn.isUserInteractionEnabled = false
                    }
                    player1ScoreLabel.text = String(1 + Int(player1ScoreLabel.text!)!)
                    restartBtn.isHidden = false
                    topRestartBtn.isHidden = true
                    break
                }
                else{
                    topLabel.text = "Player 2 Wins!"
                    for btn in btns{
                        btn.isUserInteractionEnabled = false
                    }
                    player2ScoreLabel.text = String(1 + Int(player2ScoreLabel.text!)!)
                    restartBtn.isHidden = false
                    topRestartBtn.isHidden = true
                    break
                }
            }
        }
    }
    
}

