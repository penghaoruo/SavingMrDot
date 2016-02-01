//
//  RDRCharacterViewController.swift
//  RunDotRun
//
//  Created by Haoruo Peng on 1/15/16.
//  Copyright © 2016 Haoruo Peng. All rights reserved.
//

import UIKit
import SpriteKit

class RDRCharacterViewController: UIViewController {
    var soundEffects = [String: RDRAudioPlayer]()
    
    func addBackground() {
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let background = UIImageView(frame: CGRectMake(0, 0, width, height))
        background.image = UIImage(named: "CHARACTER_SCREEN_FARM")
        background.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
        
        let jeanImg = UIImageView(frame: CGRectMake(0, 0, width, height))
        jeanImg.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_JEAN_NORMAL")
        jeanImg.contentMode = UIViewContentMode.ScaleAspectFill
        jeanImg.tag = 2
        self.view.addSubview(jeanImg)
        
        let jeanText = UIImageView(frame: CGRectMake(0, 0, width, height))
        jeanText.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_JEAN_TEXT")
        jeanText.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(jeanText)
        
        let button_jean = UIButton(type: UIButtonType.System) as UIButton
        button_jean.frame = CGRectMake(245, 140, 70, 110)
        button_jean.backgroundColor =  UIColor.clearColor()
        button_jean.layer.cornerRadius = 0.3 * button_jean.bounds.size.height
        button_jean.addTarget(self, action: "buttonTransit:", forControlEvents: UIControlEvents.TouchUpInside)
        button_jean.addTarget(self, action: "buttonActivate:", forControlEvents: UIControlEvents.TouchDown)
        button_jean.addTarget(self, action: "buttonDeactivate:", forControlEvents: UIControlEvents.TouchUpOutside)
        button_jean.tag = 3
        self.view.addSubview(button_jean)
        
        let captainImg = UIImageView(frame: CGRectMake(0, 0, width, height))
        captainImg.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_CAPTAIN_NORMAL")
        captainImg.contentMode = UIViewContentMode.ScaleAspectFill
        captainImg.tag = 4
        self.view.addSubview(captainImg)
        
        let captainText = UIImageView(frame: CGRectMake(0, 0, width, height))
        captainText.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_CAPTAIN_TEXT")
        captainText.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(captainText)
        
        let button_captain = UIButton(type: UIButtonType.System) as UIButton
        button_captain.frame = CGRectMake(365, 145, 85, 130)
        button_captain.backgroundColor = UIColor.clearColor()
        button_captain.layer.cornerRadius = 0.3 * button_captain.bounds.size.height
        button_captain.addTarget(self, action: "buttonTransit:", forControlEvents: UIControlEvents.TouchUpInside)
        button_captain.addTarget(self, action: "buttonActivate:", forControlEvents: UIControlEvents.TouchDown)
        button_captain.addTarget(self, action: "buttonDeactivate:", forControlEvents: UIControlEvents.TouchUpOutside)
        button_captain.tag = 5
        self.view.addSubview(button_captain)
        
        let zippyImg = UIImageView(frame: CGRectMake(0, 0, width, height))
        zippyImg.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_ZIPPY_NORMAL")
        zippyImg.contentMode = UIViewContentMode.ScaleAspectFill
        zippyImg.tag = 6
        self.view.addSubview(zippyImg)
        
        let zippyText = UIImageView(frame: CGRectMake(0, 0, width, height))
        zippyText.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_ZIPPY_TEXT")
        zippyText.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(zippyText)
        
        let button_zippy = UIButton(type: UIButtonType.System) as UIButton
        button_zippy.frame = CGRectMake(470, 225, 95, 105)
        button_zippy.backgroundColor = UIColor.clearColor()
        button_zippy.layer.cornerRadius = 0.3 * button_zippy.bounds.size.height
        button_zippy.addTarget(self, action: "buttonTransit:", forControlEvents: UIControlEvents.TouchUpInside)
        button_zippy.addTarget(self, action: "buttonActivate:", forControlEvents: UIControlEvents.TouchDown)
        button_zippy.addTarget(self, action: "buttonDeactivate:", forControlEvents: UIControlEvents.TouchUpOutside)
        button_zippy.tag = 7
        self.view.addSubview(button_zippy)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackground()
    }
    
    func buttonTransit(sender: UIButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tagNum = sender.tag
        var nextViewController: UIViewController
        switch (tagNum) {
        case 3:
            constants.dotName = "JEAN"
            nextViewController = storyBoard.instantiateViewControllerWithIdentifier("GameView") as! GameViewController
            self.presentViewController(nextViewController, animated:true, completion:nil)
            break
        case 5:
            constants.dotName = "CAPTAIN"
            nextViewController = storyBoard.instantiateViewControllerWithIdentifier("GameView") as! GameViewController
            self.presentViewController(nextViewController, animated:true, completion:nil)
            break
        case 7:
            constants.dotName = "ZIPPY"
            nextViewController = storyBoard.instantiateViewControllerWithIdentifier("GameView") as! GameViewController
            self.presentViewController(nextViewController, animated:true, completion:nil)
            break
        default:
            break
        }
    }
    
    func buttonActivate(sender: UIButton!) {
        let tagNum = sender.tag - 1
        let img = view.viewWithTag(tagNum) as! UIImageView
        switch (tagNum) {
        case 2:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_JEAN_ACTIVATED")
            break
        case 4:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_CAPTAIN_ACTIVATED")
            break
        case 6:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_ZIPPY_ACTIVATED")
            break
        default:
            break
        }
        playSoundEffect("BUTTON_PRESS_2") // BUTTON_PRESS_1, BUTTON_PRESS_3
    }
    
    func buttonDeactivate(sender: UIButton!) {
        let tagNum = sender.tag - 1
        let img = view.viewWithTag(tagNum) as! UIImageView
        switch (tagNum) {
        case 2:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_JEAN_NORMAL")
            break
        case 4:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_CAPTAIN_NORMAL")
            break
        case 6:
            img.image = UIImage(named: "CHARACTER_SCREEN_BUTTON_ZIPPY_NORMAL")
            break
        default:
            break
        }
    }
    
    func playSoundEffect(key: String) {
        var player: RDRAudioPlayer
        if (soundEffects.keys.contains(key)) {
            player = soundEffects[key]!
        } else {
            player = RDRAudioPlayer(filename: key, num: 0)
            player.setVolume(constants.soundVolume)
            soundEffects[key] = player
        }
        player.playMusic()
    }
    
    func stopSoundEffect(key: String) {
        if (soundEffects.keys.contains(key)) {
            let player = soundEffects[key]!
            player.stopMusic()
        }
    }
    
    func stopAllSoundEffect() {
        for player in soundEffects.values {
            player.stopMusic()
        }
    }
}