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
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeView: MPVolumeView!
    var song: MPMediaItem?
    let player = MPMusicPlayerController.systemMusicPlayer()
    @IBAction func togglePlaying() -> Void{
        if player.playbackState == .Playing{
            playPauseButton.setTitle("Play", forState: .Normal)
            player.pause()
        }
        else{
            playPauseButton.setTitle("Pause", forState: .Normal)
            player.play()
        }
    }
    override func viewDidLoad() -> Void{
        super.viewDidLoad()
        player.setQueueWithItemCollection(MPMediaItemCollection(items: [song!]))
        player.play()
        playPauseButton.setTitle("Pause", forState: .Normal)
        if let art = song!.artwork{
            albumArtImageView.image = art.imageWithSize(art.bounds.size)
        }
        titleLabel.text = song!.title
        infoLabel.text = "\(song!.artist) - \(song!.albumTitle)"
        let airPlayImage = volumeView.routeButtonImageForState(.Normal)
        UIGraphicsBeginImageContext(airPlayImage.size)
        let context = UIGraphicsGetCurrentContext()
    }
}