//
//  Perfil.swift
//  practicaIOS
//
//  Created by PABLO CRUZ MENDEZ on 19/4/18.
//  Copyright © 2018 LUCAS PAJARES PRIETO. All rights reserved.
//

import UIKit

class Perfil: NSObject {

    
    
    var sNombre:String?
    var sEmail:String?
    var bLat = ""
    var bLong = ""
    
    
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as? String
        sEmail = valores["email"] as? String
        
        print("Nombre: ",sNombre)
        print("Email: ",sEmail)
    }
    
    func getMap() -> [String:Any] {
        return[
            "nombre": sNombre as Any,
            "email": sEmail as Any
        ]
    }
    
}
