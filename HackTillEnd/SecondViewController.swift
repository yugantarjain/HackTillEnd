//
//  SecondViewController.swift
//  HackTillEnd
//
//  Created by yugantar jain on 12/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import AVFoundation
import MessageUI

class SecondViewController: UIViewController, AVAudioPlayerDelegate, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func sms(_ sender: UIButton) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["9643681599"]
        composeVC.body = "HELP NEEDED"
        // Present the view controller modally.
        self.performSegue(withIdentifier: "composeVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            let audioPlayer = Bundle.main.path(forResource: "al", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
        }
        catch
        {
            //error
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var alarmButton: UIButton!
    @IBAction func alarmStart(_ sender: UIButton) {
        let state = player.isPlaying
        if(state == false)
        {
            player.play()
            player.numberOfLoops = -1
            alarmButton.setTitle("Alarm(STOP)", for: .normal)
        }
        else
        {
            player.stop()
            alarmButton.setTitle("Alarm(START)", for: .normal)
        }
        
    }
    
}

