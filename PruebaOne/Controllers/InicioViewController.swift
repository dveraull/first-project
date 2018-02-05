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
    @IBOutlet weak var dpFechaNacMascota: UIDatePicker!
    @IBOutlet weak var swMascota: UISwitch!
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
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .short
        dateComponentsFormatter.allowedUnits = [.year,.month, .day]
        
        let today = Date()
        
        let fechaNacimientoPersona = dpFechaNacPersona.date
        let fechaNacimientoMascota = dpFechaNacMascota.date
        
        let edadPersonaString = dateComponentsFormatter.string(from: fechaNacimientoPersona,to:today)!
        let edadMascotaString = dateComponentsFormatter.string(from: fechaNacimientoMascota,to:today)!
        
        let edadPersonaNumbers = stringsToNumbers(edadPersonaString)
        let edadMascotaNumbers = stringsToNumbers(edadMascotaString)
        
        calculosViewController.edadPersonaStr = edadString(anyos: edadPersonaNumbers.anyos, meses: edadPersonaNumbers.meses, dias: edadPersonaNumbers.dias)
        
        var edadAnyoMascota = 0
        
        if swMascota.isOn {
            edadAnyoMascota = edadPerro(edad: edadMascotaNumbers.anyos)
        } else {
            edadAnyoMascota = edadGato(edad: edadMascotaNumbers.anyos)
        }
        
        calculosViewController.edadMascotaStr = edadString(anyos: edadAnyoMascota, meses: edadMascotaNumbers.meses, dias: edadMascotaNumbers.dias)
        
        let diferenciaAnyos = edadPersonaNumbers.anyos - edadAnyoMascota
        var diffEdad = ""
        
        if diferenciaAnyos >= 0 {
            diffEdad = dateComponentsFormatter.string(from: fechaNacimientoPersona,to:fechaNacimientoMascota)!
        } else {
            diffEdad = dateComponentsFormatter.string(from: fechaNacimientoMascota,to:fechaNacimientoPersona)!
        }
        
        let diffEdadNumbers = stringsToNumbers(diffEdad)
        let diffEdadString = edadString(anyos: diferenciaAnyos, meses: diffEdadNumbers.meses, dias: diffEdadNumbers.dias)
        
        var descripcion = ""
        
        let diferenciaMeses = edadPersonaNumbers.meses - edadMascotaNumbers.meses
        let diferenciaDias = edadPersonaNumbers.dias - edadMascotaNumbers.dias
        
        if diferenciaAnyos == 0 && diferenciaMeses == 0 && diferenciaDias == 0 {
            descripcion = "Tu mascota y tú tienen la misma edad."
        } else if diferenciaAnyos < 0 || diferenciaMeses < 0 || diferenciaDias < 0 {
            descripcion = "Tu mascota es mayor que tú por \(diffEdadString)"
        } else {
            descripcion = "Tú eres mayor que tu mascota por \(diffEdadString)"
        }
        
        calculosViewController.descripcionStr = descripcion
        
    }
    
    
    func edadPerro(edad: Int) -> Int{
        return edad * 7
    }
    
    func edadGato(edad: Int) -> Int{
        return edad * 9
    }
    
    func edadString(anyos: Int, meses: Int, dias: Int) -> String{
        var edad = "\(abs(anyos)) "
        
        if abs(anyos) == 1 {
            edad += "año, "
        } else {
            edad += "años, "
        }
        
        edad += "\(abs(meses)) "
        
        if abs(meses) == 1 {
            edad += "mes, "
        } else {
            edad += "meses, "
        }
        
        edad += "\(abs(dias)) "
        
        if abs(dias) == 1 {
            edad += "día."
        } else {
            edad += "días."
        }
        
        return edad
    }
    
    func stringsToNumbers(_ string: String) -> (anyos: Int, meses: Int, dias: Int){
        
        let components = (string.components(separatedBy: ","))
        
        var dictionary: [Int: [String]] = [:]
        
        var i = 0
        for component in components{
            var array = [String]()
            if i > 0 {
                array = component.components(separatedBy: " ")
                array.remove(at: 0)
            } else {
                array = component.components(separatedBy: " ")
            }
            dictionary[i] = array
            i += 1
        }
        
        var anyos: Int = 0
        var meses: Int = 0
        var dias: Int = 0
        
        for (_, array) in dictionary {
            let num = array[0]
            let str = array[1]
            
            switch str {
            case "yrs","yr":
                anyos = Int(num)!
            case "mths","mth":
                meses = Int(num)!
            case "days","day":
                dias = Int(num)!
            default:
                anyos = 0
                meses = 0
                dias = 0
            }
            
        }
        return (anyos,meses,dias)
        
    }
    
    @IBAction func calcular(_ sender: Any) {
        
        performSegue(withIdentifier: "segueCalcular", sender: self)
        
    }
    
    
}