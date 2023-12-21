//
//  ViewController.swift
//  AprendiendoServicios
//
//  Created by Antony Huaman Alikhan on 20/12/23.
//

import UIKit
import Alamofire

//1. Crear modelo Codable (structura)
//2. Utilizar JSONDecoder para serializar Data a Modelo

struct Human : Codable {
    let user:String
    let age:Int
    let isHappy:Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchService()
        
    }
    
    // Endpoint:https://run.mocky.io/v3/e69e76af-1159-4254-b7eb-4d8d94710696
    // 1. Crear excepcion de seguridad.
    // 2. Crear URL con el endpoint
    // 3. Hacer request con la ayuda de URLSession
    // 4. Transformar respuesta a diccionario
    // 5. Ejecutar request+
    
    private func fetchService() {
        
        let url = "https://run.mocky.io/v3/e69e76af-1159-4254-b7eb-4d8d94710696"
        
        guard let endpoint = URL(string: url) else {
            return
        }
        
        activityIndicator.startAnimating()
        
        AF.request(endpoint, method: HTTPMethod.get, parameters: nil).responseData { response in
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            if response.error != nil {
                print("Hubo un error")
                return
            }
            
            guard
                let dataFromService = response.data,
                let model: Human = try? JSONDecoder().decode(Human.self, from: dataFromService) else {
                return
            }
            
            //Importante todos los llamados al UI se hacen en el main thread
            DispatchQueue.main.async {
                self.nameLabel.text = model.user
                self.statusLabel.text = model.isHappy ? "Es Feliz" : "Es triste!"
            }
        }
        
    }


}

