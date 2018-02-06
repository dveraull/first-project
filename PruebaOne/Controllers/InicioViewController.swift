//
//  InicioViewController.swift
//  PruebaOne
//
//  Created by Aceleradora Mobile Perú on 25/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {
    @IBOutlet weak var lblBienvenida: UILabel!
    @IBOutlet weak var dpFechaNacPersona: UIDatePicker!
    @IBOutlet weak var dpFechaNacAmigo: UIDatePicker!
    @IBOutlet weak var btnCalcular: UIBarButtonItem!
    
    var nombreString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblBienvenida.text = "Hola \(nombreString)!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calculosViewController = segue.destination as! CalculosViewController
        
        calculosViewController.fechaPersona = dpFechaNacPersona.date
        
        calculosViewController.fechaAmigo = dpFechaNacAmigo.date
        
    }   
    
    
    @IBAction func calcular(_ sender: Any) {
        
        performSegue(withIdentifier: "segueCalcular", sender: self)
        
    }
    
    
}
