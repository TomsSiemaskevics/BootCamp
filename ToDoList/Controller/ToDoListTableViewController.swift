import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController {
    
    //@IBOutlet weak var mainTextLabel: UILabel!
    //@IBOutlet weak var subTextLabel: UILabel!
    var manageObjectContext: NSManagedObjectContext?
    var toDoLists = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageObjectContext = appDelegate.persistentContainer.viewContext
        
        
        loadData()
        
    }
    
    
    func loadData(){
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        
        do {
            let result = try manageObjectContext?.fetch(request)
            toDoLists = result!
            tableView.reloadData()
        }catch{
            fatalError("Error in loading item in to ToDo")
        }
    }
    
    func saveData(){
        do {
            try manageObjectContext?.save()
        }catch{
            fatalError("Error in saving item in to ToDo")
        }
        loadData()
    }
    
    
    @IBAction func addNewItemTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add new item", message: "Something to do?", preferredStyle: .alert)
        alertController.addTextField { textInfo in
            textInfo.placeholder = "What to do?"
        }
        alertController.addTextField {textInfo in
            textInfo.placeholder = "Description"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let mainTask = alertController.textFields?.first,
               let subTask = alertController.textFields?.last{
                print("\(mainTask), \(subTask)")
                let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: self.manageObjectContext!)
                let list = NSManagedObject(entity: entity!, insertInto: self.manageObjectContext)
                list.setValue(mainTask, forKey: "item")
                list.setValue(subTask, forKey: "item2")
                //self.saveData()
                self.tableView.reloadData()
                
            }
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true)
        /*let alertController = UIAlertController(title: "Add new item", message: "Something new to do?", preferredStyle: .alert)
         alertController.addTextField { textInfo in
         textInfo.placeholder = "Main title"
         print(textInfo)
         }
         #warning("addTextField for detailTextLabel")
         
         let addActionButton = UIAlertAction(title: "Save", style: .default) { alertAction in
         let textField = alertController.textFields?.first
         
         let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: self.manageObjectContext!)
         let list = NSManagedObject(entity: entity!, insertInto: self.manageObjectContext)
         
         list.setValue(textField?.text, forKey: "item")
         self.saveData()
         }
         
         let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
         
         alertController.addAction(addActionButton)
         alertController.addAction(cancelButton)
         
         present(alertController, animated: true) */
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoLists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        let todoItem = toDoLists[indexPath.row]
        
        cell.textLabel?.text = todoItem.item
        //cell.textLabel?.text = todoItem.value(forKey: "item2") as? String
        cell.detailTextLabel?.text = todoItem.item2
        //cell.subTextLabel.text = todoItem.value(forKey: "item2") as? String
        cell.accessoryType = todoItem.completed ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        toDoLists[indexPath.row].completed = !toDoLists[indexPath.row].completed
        saveData()
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    /*override func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     tableView.beginUpdates()
     toDoLists.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     tableView.endUpdates()
     
     }
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manageObjectContext?.delete(toDoLists[indexPath.row])
            // Delete the row from the data source
            //            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveData()
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

