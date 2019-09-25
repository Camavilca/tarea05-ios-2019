import UIKit

class SelectCursoViewController: UIViewController {

    var curso = Curso()
    
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelPracticas: UILabel!
    @IBOutlet weak var labelLaboratorios: UILabel!
    @IBOutlet weak var labelExamenFinal: UILabel!
    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var notaFinal: UILabel!
    
    
    var firstVC = ViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNombre.text = curso.nombre
        labelPracticas.text = String(curso.practica)
        labelLaboratorios.text = String(curso.laboratorio)
        labelExamenFinal.text = String(curso.examenFinal)
        notaFinal.text = String(curso.notaFinal)
        
        if curso.notaFinal >= 13 {
            self.ImgView.image = UIImage(named: "aprobado")
        }else{
             self.ImgView.image = UIImage(named: "desaprobado")
        }
        
        
       
        
    }

}
