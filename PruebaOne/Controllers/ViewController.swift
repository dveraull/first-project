//
//  ViewController.swift
//  PruebaOne
//
//  Created by Aceleradora Mobile Perú on 24/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNombre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let dosNavigation = segue.destination as! UINavigationController
        let dosViewController = dosNavigation.topViewController as! InicioViewController
        
        dosViewController.nombreString = txtNombre.text!
        
    }
    
    

    @IBAction func ingresarApp(_ sender: Any) {
        
        if (txtNombre.text != "") {
            performSegue(withIdentifier: "segueFromPrincipal", sender: self)
        }
    }
    
}

