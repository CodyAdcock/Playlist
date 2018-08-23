//
//  Playlist.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation


class Playlist: Equatable, Codable {
    
    static func == (lhs: Playlist, rhs: Playlist) -> Bool{
        if lhs.playlist != rhs.playlist {return false}
        if lhs.songs != rhs.songs {return false}
        return true
    }
    
    //by initializing as an empty array, you can have to initialize options
    //let playlist = Playlist(name: String, songs: [Song])
    //let playlist2 = Playlist(name: String)
    init(_ name: String, _ songs: [Song] = []){
        self.playlist = name
        self.songs = songs
    }
    
    let playlist: String
    var songs: [Song] = []
}


