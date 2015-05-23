//
//  MasterViewController.swift
//  Synthony
//
//  Created by Michael Hulet on 5/23/15.
//  Copyright (c) 2015 Michael Hulet. All rights reserved.
//

import UIKit
import MediaPlayer
class MHMasterViewController: UITableViewController{
    var songs = MPMediaQuery().items as! [MPMediaItem]
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        let song = songs[indexPath.row]
        cell.textLabel!.text = song.title
        cell.detailTextLabel!.text = song.artist
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void{
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}