//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by wesley on 19/03/2016.
//  Copyright © 2016 wesley. All rights reserved.
//

import Foundation

class Videos {
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    //Make a Getter
    
    var vName: String{
        return _vName
    }
    
    
    var vImageUrl: String{
        return _vImageUrl
    }
    
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    
    init (data: JSONDictionary) {
        
        //if we do no initialize all properties we will get error messages
        //Return from the initializer without initializing all stored properties
        
        // Video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        
        else
        {
            //you may not always get back data from JSON - you may want to display messages
            // elemenr in teh JSON is unexpected
            
            _vName = ""
        }
        
        // The Video Image
        
        if let img = data["im:image"] as? JSONArray,
            //image = img[1] as? JSONDictionary, if 3rd image not avalibele
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else
        {
                _vImageUrl = ""
        }
        
 
        //Video URL
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = vVideoUrl
        
        }
        else
        {
            _vVideoUrl = ""
        }
    
    }
    
}