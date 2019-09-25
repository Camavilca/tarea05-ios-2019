import UIKit

class NewCursoViewController: UIViewController {

    @IBOutlet weak var txtnombre: UITextField!
    @IBOutlet weak var txtpracticas: UITextField!
    @IBOutlet weak var txtlaboratorios: UITextField!
    @IBOutlet weak var txtexamenfinal: UITextField!
    var index = 0
    
   // var firsVC  = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardarCurso(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let curso = Curso(context: context)
        
        curso.nombre = txtnombre.text!
        curso.practica = Int32(Int(txtpracticas.text!)!)
        curso.laboratorio = Int32(Int(txtlaboratorios.text!)!)
        curso.examenFinal = Int32(Int(txtexamenfinal.text!)!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //firsVC.cursos.append(curso)
        //firsVC.tableViewCurso.reloadData()
        navigationController!.popViewController(animated: true)
        alertas(1)
    }
    
    
    func alertas(_ tipo: Int){
        var alert = UIAlertController()
        switch tipo {
        case 1:
            alert = UIAlertController(title: "Curso", message: "Curso agregado Satisfactoriamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            break
        case 2:
            alert = UIAlertController(title: "Curso", message: "Debe Completar Los Campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            break
        default:
            print("Todo Salio Error")
        }
        self.present(alert, animated: true)
    }
    
    func alert(_ title: String, _ message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        return alert
    }
    
}
