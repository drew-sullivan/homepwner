//
//  ImageStore.swift
//  Homepwner
//
//  Created by Drew Sullivan on 8/7/18.
//  Copyright © 2018 Drew Sullivan. All rights reserved.
//

import UIKit

class ImageStore {
    let cache = NSCache<NSString, UIImage>()
    
    
    // MARK: - Image Manipulateion
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    
}
