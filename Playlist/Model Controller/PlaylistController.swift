//
//  PlaylistController.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class PlaylistController{
    
    //Prevents the case of two instances trying to reach your variables and methods. It creates ONLY ONE instance to give you access to it's instance methods and variables.
    static let shared = PlaylistController()
    
    //SOURCE OF TRUTH
    var playlists:[Playlist] = []
    
    //Create
    func createPlaylist(_ name: String){
        let newPlaylist = Playlist(name)
        playlists.append(newPlaylist)
        saveToPersistentStore()
    }
    
    //Read - not to day buddy boy
    
    
    //Update - not yet
    
    
    //Delete
    func deletePlaylist(_ playlistToDelete: Playlist){
        guard let index = playlists.index(of: playlistToDelete) else {return}
        playlists.remove(at: index)
        saveToPersistentStore()
    }
    
    //MARK: - Persistence
    
    //create a file URL
    func fileURL() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "playlists.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        return fullURL
    }
    
    //Use that file URL to encode and save the data
    func saveToPersistentStore(){
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(playlists)
            print(data)
            try data.write(to: fileURL())
        }catch{
            print("There was an error Saving to Persistent Store \(error) \(error.localizedDescription) 💩")
            
        }
        
    }
    
    //Use that file url to load and decode the data
    func loadFromPersistentStore() -> [Playlist]{
        do{
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let playlists = try decoder.decode([Playlist].self, from: data)
            return playlists
        } catch {
            print("There was an error Loading from Persistent Store \(error) \(error.localizedDescription) 💩")
        }
        return[]
    }
}
