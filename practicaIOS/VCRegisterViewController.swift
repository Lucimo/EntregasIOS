//
//  VCRegisterViewController.swift
//  practicaIOS
//
//  Created by LUCAS PAJARES PRIETO on 13/4/18.
//  Copyright © 2018 LUCAS PAJARES PRIETO. All rights reserved.
//

import Firebase
import UIKit

class VCRegisterViewController: UIViewController, DataHolderDelegate {

    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPassword:UITextField?
    @IBOutlet var txtRePassword:UITextField?
    @IBOutlet var btnAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail?.text = DataHolder.sharedInstance.email
        txtUser?.text = DataHolder.sharedInstance.user
        txtPassword?.text = DataHolder.sharedInstance.pass
        txtRePassword?.text = DataHolder.sharedInstance.repass
        
        //RECUERDA
        //txtUser?.text = DataHolder.shareInstance.sNick
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickRegister(){
        
        DataHolder.sharedInstance.email = (txtEmail?.text)!
        DataHolder.sharedInstance.user = (txtUser?.text)!
        DataHolder.sharedInstance.pass = (txtPassword?.text)!
        DataHolder.sharedInstance.repass = (txtRePassword?.text)!
        
        
        DataHolder.sharedInstance.Registro(delegate: self, sEmail: (txtEmail?.text)!, sPass: (txtPassword?.text)!)
        
        /*
        Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPassword?.text)!){
            (email, error)in
            if self.txtPassword?.text != self.txtRePassword?.text{
                print("Las contraseñas no son iguales")
            }
            else if email != nil && self.txtUser?.text != nil{
                print ("Te registraste")
                
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!).setData(["email"
                    :self.txtEmail?.text, "nombre":self.txtUser?.text])
            }
            else{
                print(error!)
            }
        }*/
    }
    func dataHolderRegister(blfin: Bool) {
        if blfin==true{
            self.performSegue(withIdentifier: "trregistro", sender: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
