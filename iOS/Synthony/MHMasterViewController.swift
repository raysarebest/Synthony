//
//  MasterViewController.swift
//  Synthony
//
//  Created by Michael Hulet on 5/23/15.
//  Copyright (c) 2015 Michael Hulet. All rights reserved.
//

import UIKit
import MediaPlayer
import QuartzCore
class MHMasterViewController: UITableViewController{
    var songs = MPMediaQuery.songsQuery().items as! [MPMediaItem]
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return songs.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MHAcceptableTableViewCell
        let song = songs[indexPath.row]
        cell.titleLabel.text = song.title
        cell.artistLabel.text = song.artist
        cell.acceptabilityView.layer.cornerRadius = cell.acceptabilityView.frame.size.height / 2
        cell.acceptabilityView.backgroundColor = UIColor.lightGrayColor()
        cell.configureWithSong(song)
        if let art = song.artwork{
            cell.albumImageView.image = art.imageWithSize(cell.albumImageView.frame.size)
        }
        else{
            cell.albumImageView.image = nil
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void{
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 50
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) -> Void{
        if segue.identifier == "showDetail"{
            let index = tableView.indexPathForSelectedRow()!
            (segue.destinationViewController as! MHDetailViewController).song = songs[index.row]
            tableView.deselectRowAtIndexPath(index, animated: true)
        }
    }
}