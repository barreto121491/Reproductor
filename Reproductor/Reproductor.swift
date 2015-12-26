//
//  Reproductor.swift
//  Reproductor
//
//  Created by Arturo Barreto Villafán on 12/23/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit
import AVFoundation

class Reproductor: UIViewController {

    @IBOutlet weak var portadaImagen: UIImageView!
    
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var cancionLabel: UILabel!
    @IBOutlet weak var volumen: UISlider!
    
    var pos = 0
    var canciones : [String] = []
    var nombres : [String] = []
    var portadas : [String] = []
    var artistas : [String] = []
    
    private var reproductor : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pos)
        reproducirCancion(pos)
      
        
    }

  

    func reproducirCancion(cancion : Int){
        let sonidoURL = NSBundle.mainBundle().URLForResource(canciones[cancion], withExtension: "mp3")
        portadaImagen.image = UIImage(named: portadas[cancion])
          cancionLabel.text = nombres[cancion]
        artistaLabel.text = artistas[cancion]
        
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            if !reproductor.playing{
                 reproductor.play()
            }
           
            
        }
        catch{
            print("Error al cargar el Archivo de sonido")
        }
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        let cc = segue.destinationViewController
        if cc is ViewController{
            //let destino = segue.destinationViewController as! ViewController
            
            
           reproductor.stop()
            reproductor.currentTime = 0.0
            
        }
    }

    
 
   
    @IBAction func volumenAction(sender: AnyObject) {
        
        
        reproductor.volume = volumen.value
    }
    
    @IBAction func play(sender: AnyObject) {
        
        
        if !reproductor.playing{
            reproductor.play()
        }
        
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        if reproductor.playing{
            reproductor.pause()
            
        }
        
    }
    @IBAction func stop(sender: AnyObject) {
        if reproductor.playing || reproductor.currentTime != 0{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        
    }
    @IBAction func shuffle(sender: AnyObject) {
        
        let posicion = Int(arc4random()) % canciones.count
        reproducirCancion(posicion)
    }
}
