//
//  ViewController.swift
//  TOKEI-R4
//
//  Created by goemon12 on 2018/11/29.
//  Copyright © 2018 goemon12. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    var scene: SKScene!
    var nodeS: [SKLabelNode] = []
    var nodeM: [SKLabelNode] = []
    var nodeH: [SKLabelNode] = []
    var fmtH: DateFormatter!
    var fmtM: DateFormatter!
    var fmtS: DateFormatter!

    func Time() {
        let date = Date()
        let strH = fmtH.string(from: date)
        let strM = fmtM.string(from: date)
        let strS = fmtS.string(from: date)
        let intH = Int(strH)!
        let intM = Int(strM)!
        let intS = Int(strS)!
        
        for i in 0 ..< 24 {
            nodeH[i].text = "\((intH + i +  9) % 24)"
        }
        
        for i in 0 ..< 60 {
            nodeM[i].text = "\((intM + i + 23) % 60)"
            nodeS[i].text = "\((intS + i + 23) % 60)"
        }
    }
    
    func makeNode() {
        for _ in 0 ..< 60 {
            nodeS.append(SKLabelNode(fontNamed: "Courier"))
            nodeM.append(SKLabelNode(fontNamed: "Courier"))
        }
        for _ in 0 ..< 24 {
            nodeH.append(SKLabelNode(fontNamed: "Courier"))
        }
    }

    func stupNode() {
        for i in 0 ..< 60 {
            nodeS[i].text = "\(i)"
            nodeS[i].fontSize = 12
            nodeS[i].horizontalAlignmentMode = .center
            nodeS[i].verticalAlignmentMode = .center
            if i < 15 {
                nodeS[i].position.x =  10
                nodeS[i].position.y =  90 + 300 / 15 * CGFloat(i -  0)
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  300 / 15, duration: 0),
                    SKAction.moveBy(x: 0, y: -300 / 15, duration: 1)])))
            }
            else if i < 30 {
                nodeS[i].position.x =  10 + 300 / 15 * CGFloat(i - 15)
                nodeS[i].position.y = 390
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  300 / 15, y: 0, duration: 0),
                    SKAction.moveBy(x: -300 / 15, y: 0, duration: 1)])))
            }
            else if i < 45 {
                nodeS[i].position.x = 310
                nodeS[i].position.y = 390 - 300 / 15 * CGFloat(i - 30)
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -300 / 15, duration: 0),
                    SKAction.moveBy(x: 0, y:  300 / 15, duration: 1)])))
            }
            else {
                nodeS[i].position.x = 310 - 300 / 15 * CGFloat(i - 45)
                nodeS[i].position.y =  90
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -300 / 15, y: 0, duration: 0),
                    SKAction.moveBy(x:  300 / 15, y: 0, duration: 1)])))
            }
            scene.addChild(nodeS[i])
            
            nodeM[i].text = "\(i)"
            nodeM[i].fontSize = 12
            nodeM[i].horizontalAlignmentMode = .center
            nodeM[i].verticalAlignmentMode = .center
            if i < 15 {
                nodeM[i].position.x =  40
                nodeM[i].position.y = 120 + 240 / 15 * CGFloat(i -  0)
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  240 / 15, duration: 0),
                    SKAction.moveBy(x: 0, y: -240 / 15, duration: 60)])))
            }
            else if i < 30 {
                nodeM[i].position.x =  40 + 240 / 15 * CGFloat(i - 15)
                nodeM[i].position.y = 360
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  240 / 15, y: 0, duration: 0),
                    SKAction.moveBy(x: -240 / 15, y: 0, duration: 60)])))
            }
            else if i < 45 {
                nodeM[i].position.x = 280
                nodeM[i].position.y = 360 - 240 / 15 * CGFloat(i - 30)
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -240 / 15, duration: 0),
                    SKAction.moveBy(x: 0, y:  240 / 15, duration: 60)])))
            }
            else {
                nodeM[i].position.x = 280 - 240 / 15 * CGFloat(i - 45)
                nodeM[i].position.y = 120
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -240 / 15, y: 0, duration: 0),
                    SKAction.moveBy(x:  240 / 15, y: 0, duration: 60)])))
            }
            scene.addChild(nodeM[i])
        }
        
        for i in 0 ..< 24 {
            nodeH[i].text = "\(i)"
            nodeH[i].fontSize = 12
            nodeH[i].horizontalAlignmentMode = .center
            nodeH[i].verticalAlignmentMode = .center
            if i < 6 {
                nodeH[i].position.x =  70
                nodeH[i].position.y = 150 + 180 / 6 * CGFloat(i -  0)
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  180 / 6, duration: 0),
                    SKAction.moveBy(x: 0, y: -180 / 6, duration: 3600)])))
            }
            else if i < 12 {
                nodeH[i].position.x =  70 + 180 / 6 * CGFloat(i -  6)
                nodeH[i].position.y = 330
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  180 / 6, y: 0, duration: 0),
                    SKAction.moveBy(x: -180 / 6, y: 0, duration: 3600)])))
            }
            else if i < 18 {
                nodeH[i].position.x = 250
                nodeH[i].position.y = 330 - 180 / 6 * CGFloat(i - 12)
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -180 / 6, duration: 0),
                    SKAction.moveBy(x: 0, y:  180 / 6, duration: 3600)])))
            }
            else {
                nodeH[i].position.x = 250 - 180 / 6 * CGFloat(i - 18)
                nodeH[i].position.y = 150
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -180 / 6, y: 0, duration: 0),
                    SKAction.moveBy(x:  180 / 6, y: 0, duration: 3600)])))
            }
            scene.addChild(nodeH[i])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmtH = DateFormatter()
        fmtM = DateFormatter()
        fmtS = DateFormatter()
        fmtH.dateFormat = "HH"
        fmtM.dateFormat = "mm"
        fmtS.dateFormat = "ss"

        scene = SKScene(size: CGSize(width: 320, height: 480))
        scene.scaleMode = .aspectFit
        let skView = self.view as! SKView
        skView.presentScene(scene)

        makeNode()
        stupNode()
        Time()
        
        let dspH = SKShapeNode(circleOfRadius: 10)
        let dspM = SKShapeNode(circleOfRadius: 10)
        let dspS = SKShapeNode(circleOfRadius: 10)

        dspH.position = CGPoint(x: 250, y: 240)
        dspM.position = CGPoint(x: 280, y: 240)
        dspS.position = CGPoint(x: 310, y: 240)
        dspH.strokeColor = UIColor.red
        dspM.strokeColor = UIColor.red
        dspS.strokeColor = UIColor.red
        
        scene.addChild(dspH)
        scene.addChild(dspM)
        scene.addChild(dspS)
    }
}
