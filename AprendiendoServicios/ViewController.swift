//
//  ViewController.swift
//  AprendiendoServicios
//
//  Created by Antony Huaman Alikhan on 20/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        URLSession.shared.dataTask(with: endpoint) { (data : Data?, _, error: Error?) in
            
        }
        
    }


}

