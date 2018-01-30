//
//  ViewDosController.swift
//  PruebaOne
//
//  Created by Aceleradora Mobile Perú on 25/01/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//

import UIKit

class ViewDosController: UIViewController {
    @IBOutlet weak var lblBienvenida: UILabel!
    @IBOutlet weak var dpFechaNacPersona: UIDatePicker!
    @IBOutlet weak var dpFechaNacMascota: UIDatePicker!
    @IBOutlet weak var swMascota: UISwitch!
    @IBOutlet weak var btnCalcular: UIBarButtonItem!
    
    var nombreString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //lblBienvenida.text = "Hola \(nombre)!"
        lblBienvenida.text = "Hola \(nombreString)!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tresViewController = segue.destination as! ViewTresController
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .short
        dateComponentsFormatter.allowedUnits = [.year,.month, .day]
        
        let today = Date()
        
        let fP = dpFechaNacPersona.date
        let fM = dpFechaNacMascota.date
        
        tresViewController.edadPersonaStr = dateComponentsFormatter.string(from: fP,to:today)!
        tresViewController.edadMascotaStr = dateComponentsFormatter.string(from: fM,to:today)!
        
        
    }
    
    /*func getAge(fecha: Date) -> (anyos: Int, meses: Int) {
        
        var anyos: Int = 0
        var meses: Int = 0
        
        var today: Date = Date.init()
        
        
        
        
        return (anyos,meses)
    }*/
    
    @IBAction func calcular(_ sender: Any) {
        
        performSegue(withIdentifier: "segueCalcular", sender: self)
        
    }
    
    
}
