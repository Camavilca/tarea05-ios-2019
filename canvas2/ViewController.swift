import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var tableViewCurso: UITableView!
    var cursos:[Curso] = []
    var indexSeleccionado = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCurso.dataSource = self
        tableViewCurso.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso  = cursos[indexPath.row]
        cell.textLabel?.text = curso.nombre
        let res = promedio(curso: curso)
        if res {
            cell.backgroundColor = UIColor.green
        }else {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "selectCurso", sender: curso)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            cursos.remove(at: indexSeleccionado)
            tableView.deleteRows(at: [indexPath] , with: .fade)
        }
    }
    
    func promedio(curso:Curso) -> Bool {
        
        let pp = Double(curso.examenFinal) * 0.3
        let pl = Double(curso.laboratorio) * 0.6
        let ef = Double(curso.examenFinal) * 0.1

        let res = pp + pl + ef

        curso.notaFinal = Int(res)
        
        if res > 13 {
            return true;
        }else{
            return false;
        }
    }
    
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "newcurso", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier ==  "newcurso"{
            let siguienteVC = segue.destination as! NewCursoViewController
            siguienteVC.firsVC = self
        }
        
        if segue.identifier == "selectCurso" {
            let selectVC = segue.destination as! SelectCursoViewController
            selectVC.curso = sender as! Curso
            selectVC.firstVC = self
        }
       
    }
    
}

