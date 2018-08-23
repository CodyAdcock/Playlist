//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        //unwrap and check for blank string
        if let name = nameTextField.text, name != ""{
            //create playlist
            PlaylistController.shared.createPlaylist(name)
            //reset text field to blank
            nameTextField.text = ""
            //reload the tableView
            tableView.reloadData()
        }
    }
    
    //MARK: - Table view Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        cell.textLabel?.text = playlist.playlist
        cell.detailTextLabel?.text = "(Placeholding)"
    
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSongVC"{
            let destinationVC = segue.destination as? SongTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            destinationVC?.playlist = playlist
        }
    }
    

}
