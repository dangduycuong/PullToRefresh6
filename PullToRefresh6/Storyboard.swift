//
//  Storyboard.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

struct Storyboard {
    
}

extension Storyboard {
    
    struct Main {
        static let manager = UIStoryboard(name: "Main", bundle: nil)
        
        static func rEQRESViewController() -> REQRESViewController {
            return manager.instantiateViewController(withIdentifier: "REQRESViewController") as! REQRESViewController
        }
        
        static func dogAPIViewController() -> DogAPIViewController {
            return manager.instantiateViewController(withIdentifier: "DogAPIViewController") as! DogAPIViewController
        }
        
        static func showViewController() -> ShowViewController {
            return manager.instantiateViewController(withIdentifier: "ShowViewController") as! ShowViewController
        }
        
    }
}
