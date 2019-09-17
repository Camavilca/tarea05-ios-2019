import UIKit

class NewCursoViewController: UIViewController {

    
    
    @IBOutlet weak var txtnombre: UITextField!
    @IBOutlet weak var txtpracticas: UITextField!
    @IBOutlet weak var txtlaboratorios: UITextField!
    @IBOutlet weak var txtexamenfinal: UITextField!
    
    var firsVC  = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardarCurso(_ sender: Any) {
        let curso  = Curso()
        curso.nombre = txtnombre.text!
        curso.practica = Int(txtpracticas.text!)!
        curso.laboratorio = Int(txtlaboratorios.text!)!
        curso.examenFinal = Int(txtexamenfinal.text!)!
        firsVC.cursos.append(curso)
        firsVC.tableViewCurso.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
