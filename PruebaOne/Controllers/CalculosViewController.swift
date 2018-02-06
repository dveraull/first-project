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
    @IBOutlet weak var lblEdadAmigo: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    
    var fechaPersona = Date()
    var fechaAmigo = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextsToLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTextsToLabels(){
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .short
        dateComponentsFormatter.allowedUnits = [.year,.month, .day]
        
        let today = Date()
        
        let fechaNacimientoPersona = fechaPersona
        let fechaNacimientoAmigo = fechaAmigo
        
        let edadPersonaString = dateComponentsFormatter.string(from: fechaNacimientoPersona,to:today)!
        let edadAmigoString = dateComponentsFormatter.string(from: fechaNacimientoAmigo,to:today)!
        
        let edadPersonaNumbers = stringsToNumbers(edadPersonaString)
        let edadAmigoNumbers = stringsToNumbers(edadAmigoString)
        
        lblEdadPersona.text = edadString(anyos: edadPersonaNumbers.anyos, meses: edadPersonaNumbers.meses, dias: edadPersonaNumbers.dias)
        
        lblEdadAmigo.text = edadString(anyos: edadAmigoNumbers.anyos, meses: edadAmigoNumbers.meses, dias: edadAmigoNumbers.dias)
        
        let diferenciaAnyos = edadPersonaNumbers.anyos - edadAmigoNumbers.anyos
        let diferenciaMeses = edadPersonaNumbers.meses - edadAmigoNumbers.meses
        let diferenciaDias = edadPersonaNumbers.dias - edadAmigoNumbers.dias
        
        var diffEdad = ""
        
        if diferenciaAnyos >= 0 {
            diffEdad = dateComponentsFormatter.string(from: fechaNacimientoPersona,to:fechaNacimientoAmigo)!
        } else {
            diffEdad = dateComponentsFormatter.string(from: fechaNacimientoAmigo,to:fechaNacimientoPersona)!
        }
        
        let diffEdadNumbers = stringsToNumbers(diffEdad)
        let diffEdadString = edadString(anyos: diffEdadNumbers.anyos, meses: diffEdadNumbers.meses, dias: diffEdadNumbers.dias)
        
        var descripcion = ""
        
        
        if diferenciaAnyos == 0 && diferenciaMeses == 0 && diferenciaDias == 0 {
            descripcion = "Tu amigo y tú tienen la misma edad."
        } else if (diferenciaAnyos < 0) || (diferenciaAnyos == 0 && diferenciaMeses < 0) || (diferenciaAnyos == 0 && diferenciaMeses == 0 && diferenciaDias < 0){
            descripcion = "Tu amigo es mayor por \(diffEdadString)"
        } else {
            descripcion = "Tú eres mayor por \(diffEdadString)"
        }
        
        lblDescripcion.text = descripcion
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
    
    

}
