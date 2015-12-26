//
//  ViewController.swift
//  Reproductor
//
//  Created by Arturo Barreto Villafán on 12/23/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let artistas : [String] = ["Tina Turner","James Brown","Daft Punk","Archie Bronson","Barry White"]
     let canciones : [String] = ["Simply the best","I feel good","Derezzed","Dead Funny","My First My Last My Everything"]
    let portadas : [String] = ["Tina Turner.jpg","James Brown.jpg","derezzed.jpeg","deadfunny.jpg","Barry White.jpg"]
    
    let archivos : [String] = ["1 - Tina Turner - Simply the best","2 - James Brown - I feel good","3 - Derezzed - Daft Punk","4 - Dead Funny - Archie Bronson Outfit","5 - Barry White - My First My Last My Everything"]
    @IBOutlet weak var tablaMusica: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lista de Música"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        
        self.tablaMusica.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archivos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tablaMusica.dequeueReusableCellWithIdentifier("Celda")! as UITableViewCell       //cell.textLabel?.text = self.nombres[indexPath.row]
        //cell.textLabel?.text = self.Libros[indexPath.row][0]
        
        cell.textLabel?.text = self.archivos[indexPath.row]
        cell.imageView?.image =  UIImage(named: self.portadas[indexPath.row])
        
        
        
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        let siguienteVista =  segue.destinationViewController as! Reproductor
        
        let ip = self.tablaMusica.indexPathForSelectedRow
        
        //siguienteVista.imagenes = imagenes[(ip?.row)!]
        
        
        siguienteVista.canciones = archivos
        siguienteVista.nombres = canciones
        siguienteVista.portadas = portadas
        siguienteVista.artistas = artistas
        siguienteVista.pos = (ip?.row)!
        //siguienteVista.reproductor.stop()
        //siguienteVista.reproductor.currentTime = 0.0
        
        
        
        
        
        
    }
    


}

