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
    
    
    var HMIMG :[String: UIImage]=[:]
    var fireStoreDB:Firestore?
    var firStorage:Storage?
    var miPerfil:Perfil = Perfil()
    var arCiudades:[City] = []
    
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        let citiesRef = fireStoreDB?.collection("coordenadas")
        
        citiesRef?.document().setData([
            "coordenadas": [90, 00],
            "titulo": "Testigo segundo try"
            ]
        )
       /**
        
        citiesRef?.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000
            ])
        citiesRef?.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000
            ])
        citiesRef?.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000
            ])
        citiesRef?.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000
            ])
        citiesRef?.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000
            ])*/
        }
    func descargarCiudades(delegate:DataHolderDelegate){
       
        DataHolder.sharedInstance.fireStoreDB?.collection("cities").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaCiudadesCompleta!(blnFin: false)
            } else {
                self.arCiudades=[]
                for document in querySnapshot!.documents {
                    let ciudad:City = City()
                    ciudad.sID=document.documentID
                    ciudad.setMap(valores: document.data())
                    self.arCiudades.append(ciudad)
                    print("\(document.documentID) => \(document.data())")
                }
                print("----->>>> ",self.arCiudades.count)
                delegate.DHDDescargaCiudadesCompleta!(blnFin: true)
            }
            //self.tbMiTabla?.reloadData()
        }
        
    }
   
 
}
@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaCiudadesCompleta(blnFin:Bool)
}
