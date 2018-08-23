//
//  Song.swift
//  Playlist
//
//  Created by Cody on 8/22/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Song: Equatable, Codable{
    
    static func == (lhs: Song, rhs: Song) -> Bool{
        if lhs.artist != rhs.artist {return false}
        if lhs.title != rhs.title{return false}
        return true
    }
    
    init(title: String, artist: String){
        self.title = title
        self.artist = artist
    }
    
    let title: String
    let artist: String
    
}
