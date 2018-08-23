//
//  SongController.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class SongController{
    
    //Singleton
    static let shared = SongController()
    
    //Source of Truth
    
    
    //Create
    func createSong(_ title: String, _ artist: String,_ playlist: Playlist){
        let newSong = Song(title: title, artist: artist)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    //Read
    
    
    //Update
    
    
    //Delete
    func deleteSong(_ songToDelete: Song, _ playlist: Playlist){
        guard let index = playlist.songs.index(of: songToDelete) else {return}
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistentStore()
    }
}
