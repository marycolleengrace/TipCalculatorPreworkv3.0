//
//  ViewController.swift
//  TipCalculatorPrework
//
//  Created by Colleen Ponraj on 1/23/21.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var modetoggle: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clear // Whatever color you like
           UITableViewCell.appearance().selectedBackgroundView = clearView
        
        //self.tableView.backgroundColor = Style.BGColorBlue
        
        let defaults = UserDefaults.standard
         changeColor()  

        let mode = defaults.bool(forKey: "Mode")
        
        modetoggle.isOn = mode
        
        let rootViewController: UINavigationController?
        rootViewController = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController as? UINavigationController

        if mode {
          
            self.navigationController?.overrideUserInterfaceStyle = .dark
            rootViewController?.navigationController?.overrideUserInterfaceStyle = .dark
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.overrideUserInterfaceStyle = .dark


        }else{
            self.navigationController?.overrideUserInterfaceStyle = .light
            rootViewController?.navigationController?.overrideUserInterfaceStyle = .light
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.overrideUserInterfaceStyle = .light


        }

    }
             
       
        
     
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//
//        let cell = tableView.cellForRow(at: indexPath)
//
//        // Configure the cell...
//
//        //cell!.accessoryType = cell!.isSelected ? .checkmark : .none
//
//
//        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
//                  //cell.accessoryType = .none
//
//            cell.accessoryType = cell.isSelected ? .checkmark : .none
//
//              }
//
//        return cell!
//    }
    

    //Code Cell Selected
    //func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath){
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = 0//indexPath.section
        let numberOfRows = tableView.numberOfRows(inSection: section)
            for row in 0..<numberOfRows {
                if row == indexPath.row {
                    if let cell = tableView.cellForRow(at: indexPath) {
                        if cell.accessoryType == .checkmark
                                {
                            cell.accessoryType = .none
                                }
                                else
                                {
                                    cell.accessoryType = .checkmark
                                }
                            }
                }else{
                if let cell = tableView.cellForRow(at: NSIndexPath(row: row, section: section) as IndexPath) {
                    cell.accessoryType = row == indexPath.row ? .checkmark : .none
                }
                }
            }
        
        
        
        
        
        let defaults = UserDefaults.standard

        if indexPath.section == 0 {
            
        
        switch indexPath.row {
        case 0:
            
            defaults.set(indexPath.row, forKey: "Theme")


            break
        case 1:
            
            defaults.set(indexPath.row, forKey: "Theme")


            break
        case 2:
            defaults.set(indexPath.row, forKey: "Theme")


            break
        case 3:
            defaults.set(indexPath.row, forKey: "Theme")


            break
        default:
            break
        }
        }
        
        defaults.synchronize()
        
        UIView.animate(withDuration: 1) { [self] in

        changeColor()
        }
 

      }
    
    func changeColor()  {
        let defaults = UserDefaults.standard
        
        let theme = defaults.integer(forKey: "Theme")
        
        
        
        switch theme {
        case 0:
            self.view.backgroundColor = Style.BGColor
            
                self.navigationController?.navigationBar.barTintColor  = Style.BGColor


            break
        case 1:
            self.view.backgroundColor = Style.BGColorBlue
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorBlue

            break
        case 2:
            self.view.backgroundColor = Style.BGColorPink
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorPink

            break
        case 3:
            self.view.backgroundColor = Style.BGColorPurple
            self.navigationController?.navigationBar.barTintColor  = Style.BGColorPurple

            break
        default:
            break
        }
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:Style.textColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
        
        
       
    }
    
    
    @IBAction func changeMode(_ sender: UISwitch) {
        
        
        let defaults = UserDefaults.standard

              if sender.isOn {
                defaults.set(sender.isOn, forKey: "Mode")
              }else{
                defaults.set(sender.isOn, forKey: "Mode")

              }
        
        defaults.synchronize()
        



    }
    
    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//
//        let cell = tableView.cellForRow(at: indexPath)
//
//        //cell!.selectionStyle = .none
//
//        return true
//    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
