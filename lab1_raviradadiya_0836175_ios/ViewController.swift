//
//  ViewController.swift
//  lab1_raviradadiya_0836175_ios
//
//  Created by Ravi Radadiya on 2022-01-18.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBAction func Buttons (_ sender: UIButton)
    {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true )
        {
            gameState[sender.tag-1] = activePlayer
            if(activePlayer == 1)
            {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 &&
                gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS HAS WON!"
                    
                }
                else{
                    label.text = "NOUGHT HAS WON!"
                }
                
                PlayAgainButton.isHidden = false
                label.isHidden = false
            }
            
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "Game WAS DRAW"
            label.isHidden = false
            PlayAgainButton.isHidden = false
        }
        
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    @IBAction func PlayAgain(_ sender: UIButton)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        PlayAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

