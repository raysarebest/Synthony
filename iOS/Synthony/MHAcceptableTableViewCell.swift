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
        if let rating = NSUserDefaults.standardUserDefaults().objectForKey(song.title) as? Int{
            println("Entry Found")
            updateColorWithRating(rating)
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var error: NSError? = nil
            if let rating: AnyObject = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: NSURL(string: "http://macaroni.jorgenware.com/processlyrics.php?artist=\(song.artist.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)&song=\(song.title.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)")!)!, options: nil, error: &error){
                if let score = rating["score"] as? NSString{
                    println(score)
                    NSUserDefaults.standardUserDefaults().setInteger(score.integerValue, forKey: song.title)
                    dispatch_async(dispatch_get_main_queue(), {() -> Void in
                        self.updateColorWithRating(score.integerValue)
                    })
                }
                else{
                    println(rating["error"]!)
                }
            }
            else{
                println(error!)
            }
        })
    }
    private func updateColorWithRating(rating: Int) -> Void{
        let color: UIColor
        if rating == 0{
            color = UIColor.greenColor()
        }
        else if rating <= 50{
            color = UIColor.yellowColor()
        }
        else{
            color = UIColor.redColor()
        }
        acceptabilityView.backgroundColor = color
    }
}
