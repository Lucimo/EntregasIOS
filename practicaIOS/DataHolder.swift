//
//  DataHolder.swift
//  practicaIOS
//
//  Created by LUCAS PAJARES PRIETO on 17/4/18.
//  Copyright © 2018 LUCAS PAJARES PRIETO. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    
    var fireStoreDB:Firestore?
    
    var miPerfil:Perfil = Perfil()
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
    }
    
}

