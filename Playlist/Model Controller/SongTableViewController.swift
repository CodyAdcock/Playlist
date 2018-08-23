//
//  SongTableViewController.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    var playlist: Playlist?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        
        if titleTextField.text != "" && artistTextField.text != ""{
            
            guard let newTitle = titleTextField.text,
                let newArtist = artistTextField.text,
            let playlist = playlist else {return}
            
            SongController.shared.createSong(newTitle, newArtist, playlist)
        }
        tableView.reloadData()
        titleTextField.text = ""
        artistTextField.text = ""
    }
    
    //MARK: - Data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return playlist?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = playlist?.songs[indexPath.row]
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist
        
        return cell
    }
 

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let playlist = playlist else {return}
            let song = playlist.songs[indexPath.row]
            SongController.shared.deleteSong(song, playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }



}
