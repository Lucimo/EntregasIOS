
//  TVCMiCelda.swift
//  practicaIOS
//
//  Created by LUCAS PAJARES PRIETO on 13/4/18.
//  Copyright © 2018 LUCAS PAJARES PRIETO. All rights reserved.
//

import UIKit
import Firebase
class TVCMiCelda: UITableViewCell, DataHolderDelegate {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgCelda1:UIImageView?
    var ImagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func descargarImagenes(url:String){
        self.imgCelda1?.image = nil
        DataHolder.sharedInstance.executeimagen(clave: url, delegate: self)
        //if ImagenDescargada == nil{
        /*
        let Imgdes = DataHolder.sharedInstance.HMIMG[uri]
        
        if(Imgdes != nil){
            self.ImagenDescargada = Imgdes
            self.imgCelda1?.image = self.ImagenDescargada
            
        }else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                } else {
                    
                    self.ImagenDescargada = UIImage(data: data!)
                    self.imgCelda1?.image = self.ImagenDescargada
                }
                
                DataHolder.sharedInstance.HMIMG[uri] = self.imgCelda1?.image
            }
        }*/
    }
    func imagen(imagen: UIImage) {
        self.imgCelda1?.image = imagen
    }
    
    
    
}

