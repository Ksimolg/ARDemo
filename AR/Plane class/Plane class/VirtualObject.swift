//
//  VirtualObject.swift
//  Plane class
//
//  Created by _ on 02.02.2021.
//

import SceneKit

class VirtualObject:SCNReferenceNode {
    
    static let availableObjects: [SCNReferenceNode] = {
        
        guard let modelesURLs = Bundle.main.url(forResource: "art.scnassets", withExtension: nil) else {return [] }
        
        let fileEnumirator = FileManager().enumerator(at: modelesURLs, includingPropertiesForKeys: nil)!
        
        return fileEnumirator.flatMap { element in
            
            let url = element as! URL
            
            guard url.pathExtension == "scn" else { return nil}
            
            
            return VirtualObject(url: url)
        }
        
    }()
    
}


