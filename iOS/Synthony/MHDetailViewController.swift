//
//  DetailViewController.swift
//  Synthony
//
//  Created by Michael Hulet on 5/23/15.
//  Copyright (c) 2015 Michael Hulet. All rights reserved.
//

import UIKit
import MediaPlayer
class MHDetailViewController: UIViewController{
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var song: MPMediaItem?
    let player = MPMusicPlayerController.systemMusicPlayer()
    @IBAction func togglePlaying() -> Void{
        if player.playbackState == .Playing{
            player.pause()
        }
        else{
            player.play()
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        player.setQueueWithItemCollection(MPMediaItemCollection(items: [song!]))
        player.play()
    }
    override func viewDidLoad() -> Void{
        super.viewDidLoad()
        if let art = song!.artwork{
            println("Art found")
            albumArtImageView.image = art.imageWithSize(albumArtImageView.frame.size)
        }
        else{
            println("No art found")
        }
        titleLabel.text = song!.title
        infoLabel.text = "\(song!.artist) - \(song!.albumTitle)"
    }
}