//
//  MHAcceptableTableViewCell.swift
//  Synthony
//
//  Created by Michael Hulet on 5/23/15.
//  Copyright (c) 2015 Michael Hulet. All rights reserved.
//

import UIKit
import MediaPlayer
class MHAcceptableTableViewCell: UITableViewCell{
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var acceptabilityView: UIView!
    func configureWithSong(song: MPMediaItem) -> Void{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var error: NSError? = nil
            let url = NSURL(string: "http://macaroni.jorgenware.com/processlyrics.php?artist=\(song.artist.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)&song=\(song.title.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)")
            if let realURL = url{
                if let rating: AnyObject = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: realURL)!, options: nil, error: &error){
                    println(rating)
                }
                else{
                    println(error!)
                    println(url)
                }
            }
            else{
                println("URL doesn't exist")
            }
        })
    }
}
