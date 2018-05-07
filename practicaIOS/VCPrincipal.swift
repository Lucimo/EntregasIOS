//
//  VCPrincipal.swift
//  practicaIOS
//
//  Created by LUCAS PAJARES PRIETO on 13/4/18.
//  Copyright © 2018 LUCAS PAJARES PRIETO. All rights reserved.
//

import UIKit

class  VCPrincipal: UIViewController , UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
    @IBOutlet var tbMiTabla:UITableView?
    //var arCiudades:[City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.descargarCiudades(delegate: self)
        
        /*
        DataHolder.sharedInstance.fireStoreDB?.collection("cities").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let ciudad:City = City()
                    ciudad.sID=document.documentID
                    ciudad.setMap(valores: document.data())
                    self.arCiudades.append(ciudad)
                    print("\(document.documentID) => \(document.data())")
                }
                print("----->>>> ",self.arCiudades.count)
            }
            self.tbMiTabla?.reloadData()
        }
        // Do any additional setup after loading the view.
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCiudadesCompleta(blnFin: Bool){
        if blnFin == true{
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arCiudades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1")as! TVCMiCelda
        
        cell.lblNombre?.text = DataHolder.sharedInstance.arCiudades[indexPath.row].sName
        
        /*
        if (indexPath.row==0){
            cell.lblNombre?.text = "Hey"
        }
        else if (indexPath.row==1){
            cell.lblNombre?.text = "Ho"
        }
         else  if(indexPath.row==2){
            cell.lblNombre?.text = "Hai"
        }
        else if (indexPath.row==3){
            cell.lblNombre?.text = "Hi"
        }
        else if(indexPath.row==4){
            cell.lblNombre?.text = "Hiya"
        }
        
        */
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HE SELECCIONADO LA POSICION: ", indexPath.row);
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     */
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tbMiTabla?.reloadData()
        })
    }

}
