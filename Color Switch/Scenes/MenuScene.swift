//
//  MenuScene.swift
//  Color Switch
//
//  Created by Rishabh Raj on 04/04/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        
        addLogo()
        addLabels()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.size.width / 4, height: frame.size.width / 4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height / 4)
        addChild(logo)
        
    }
    func addLabels() {
        let playLabel = SKLabelNode(text: "Tap to Play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50
        playLabel.fontColor = .white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
        animate(label: playLabel)
        
        let highScoreLabel = SKLabelNode(text: "Highscore:" + "\(UserDefaults.standard.integer(forKey: "HighScore"))")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40
        highScoreLabel.fontColor = .white
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        addChild(highScoreLabel)
        let recentScoreLabel = SKLabelNode(text: "Recent Score:" + "\(UserDefaults.standard.integer(forKey: "RecentScore"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40
        recentScoreLabel.fontColor = .white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: highScoreLabel.position.y - recentScoreLabel.frame.size.height * 2)
        addChild(recentScoreLabel)
    }
    
    func animate(label: SKLabelNode){
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        
        let sequence = SKAction.sequence([scaleUp,scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view?.presentScene(gameScene, transition: .push(with: .up, duration: 0.3))
    }
}
