//
//  ViewTresController.swift
//  PruebaOne
//
//  Created by Aceleradora Mobile Perú on 25/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class CalculosViewController: UIViewController {
    @IBOutlet weak var lblEdadPersona: UILabel!
    @IBOutlet weak var lblEdadMascota: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    
    var edadPersona = Int()
    var edadMascota = Int()
    
    var edadPersonaStr = ""
    var edadMascotaStr = ""
    
    var descripcionStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblEdadPersona.text = edadPersonaStr
        lblEdadMascota.text = edadMascotaStr
        lblDescripcion.text = descripcionStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    

}