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
        //文字位置と移動を変数にしました。
        //↓変更はここから
        let pos_sx: CGFloat =  10 //秒 左下座標X
        let pos_sy: CGFloat =  90 //秒 左下座標Y
        let mov_sw: CGFloat = 300 //秒 横幅X
        let mov_sh: CGFloat = 300 //秒 縦幅Y
        let pos_mx: CGFloat =  40 //分 左下座標X
        let pos_my: CGFloat = 120 //分 左下座標Y
        let mov_mw: CGFloat = 240 //分 横幅X
        let mov_mh: CGFloat = 240 //分 縦幅Y
        let pos_hx: CGFloat =  70 //時 左下座標X
        let pos_hy: CGFloat = 150 //時 左下座標Y
        let mov_hw: CGFloat = 180 //時 横幅X
        let mov_hh: CGFloat = 180 //時 縦幅Y
        //↑変更はここまで

        for i in 0 ..< 60 {
            nodeS[i].text = "\(i)"
            nodeS[i].fontSize = 12
            nodeS[i].horizontalAlignmentMode = .center
            nodeS[i].verticalAlignmentMode = .center
            if i < 15 {
                nodeS[i].position.x = pos_sx
                nodeS[i].position.y = pos_sy + mov_sh / 15 * CGFloat(i -  0)
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  mov_sh / 15, duration: 0),
                    SKAction.moveBy(x: 0, y: -mov_sh / 15, duration: 1)])))
            }
            else if i < 30 {
                nodeS[i].position.x = pos_sx + mov_sw / 15 * CGFloat(i - 15)
                nodeS[i].position.y = pos_sy + mov_sh
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  mov_sw / 15, y: 0, duration: 0),
                    SKAction.moveBy(x: -mov_sw / 15, y: 0, duration: 1)])))
            }
            else if i < 45 {
                nodeS[i].position.x = pos_sx + mov_sw
                nodeS[i].position.y = pos_sy + mov_sh - mov_sh / 15 * CGFloat(i - 30)
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -mov_sh / 15, duration: 0),
                    SKAction.moveBy(x: 0, y:  mov_sh / 15, duration: 1)])))
            }
            else {
                nodeS[i].position.x = pos_sx + mov_sw - mov_sw / 15 * CGFloat(i - 45)
                nodeS[i].position.y = pos_sy
                nodeS[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeS[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeS[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -mov_sw / 15, y: 0, duration: 0),
                    SKAction.moveBy(x:  mov_sw / 15, y: 0, duration: 1)])))
            }
            scene.addChild(nodeS[i])
            
            nodeM[i].text = "\(i)"
            nodeM[i].fontSize = 12
            nodeM[i].horizontalAlignmentMode = .center
            nodeM[i].verticalAlignmentMode = .center
            if i < 15 {
                nodeM[i].position.x = pos_mx
                nodeM[i].position.y = pos_my + mov_mw / 15 * CGFloat(i -  0)
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  mov_mh / 15, duration: 0),
                    SKAction.moveBy(x: 0, y: -mov_mh / 15, duration: 60)])))
            }
            else if i < 30 {
                nodeM[i].position.x = pos_mx + mov_mw / 15 * CGFloat(i - 15)
                nodeM[i].position.y = pos_my + mov_mh
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  mov_mw / 15, y: 0, duration: 0),
                    SKAction.moveBy(x: -mov_mh / 15, y: 0, duration: 60)])))
            }
            else if i < 45 {
                nodeM[i].position.x = pos_mx + mov_mw
                nodeM[i].position.y = pos_my + mov_mh - mov_mh / 15 * CGFloat(i - 30)
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -mov_mh / 15, duration: 0),
                    SKAction.moveBy(x: 0, y:  mov_mh / 15, duration: 60)])))
            }
            else {
                nodeM[i].position.x = pos_mx + mov_mw - mov_mw / 15 * CGFloat(i - 45)
                nodeM[i].position.y = pos_my
                nodeM[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeM[i].text!)
                        let tmp2 = (tmp1! + 1) % 60
                        self.nodeM[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -mov_mw / 15, y: 0, duration: 0),
                    SKAction.moveBy(x:  mov_mw / 15, y: 0, duration: 60)])))
            }
            scene.addChild(nodeM[i])
        }
        
        for i in 0 ..< 24 {
            nodeH[i].text = "\(i)"
            nodeH[i].fontSize = 12
            nodeH[i].horizontalAlignmentMode = .center
            nodeH[i].verticalAlignmentMode = .center
            if i < 6 {
                nodeH[i].position.x = pos_hx
                nodeH[i].position.y = pos_hy + mov_hh / 6 * CGFloat(i -  0)
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y:  mov_hh / 6, duration: 0),
                    SKAction.moveBy(x: 0, y: -mov_hh / 6, duration: 3600)])))
            }
            else if i < 12 {
                nodeH[i].position.x = pos_hx + mov_hw / 6 * CGFloat(i -  6)
                nodeH[i].position.y = pos_hy + mov_hh
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x:  mov_hw / 6, y: 0, duration: 0),
                    SKAction.moveBy(x: -mov_hw / 6, y: 0, duration: 3600)])))
            }
            else if i < 18 {
                nodeH[i].position.x = pos_hx + mov_hw
                nodeH[i].position.y = pos_hy + mov_hh - mov_hh / 6 * CGFloat(i - 12)
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: 0, y: -mov_hh / 6, duration: 0),
                    SKAction.moveBy(x: 0, y:  mov_hh / 6, duration: 3600)])))
            }
            else {
                nodeH[i].position.x = pos_hx + mov_hw - mov_hw / 6 * CGFloat(i - 18)
                nodeH[i].position.y = pos_hy
                nodeH[i].run(SKAction.repeatForever(SKAction.sequence([
                    SKAction.run {
                        let tmp1 = Int(self.nodeH[i].text!)
                        let tmp2 = (tmp1! + 1) % 24
                        self.nodeH[i].text = "\(tmp2)"
                    },
                    SKAction.moveBy(x: -mov_hw / 6, y: 0, duration: 0),
                    SKAction.moveBy(x:  mov_hw / 6, y: 0, duration: 3600)])))
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
