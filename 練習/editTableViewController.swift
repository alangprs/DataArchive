//
//  editTableViewController.swift
//  練習
//
//  Created by 翁燮羽 on 2021/6/6.
//

import UIKit

class editTableViewController: UITableViewController {

    @IBOutlet weak var nameTex: UITextField!
    
    @IBOutlet weak var birthdayTex: UITextField!
   
    var data:Data?
    
    //控制是否跳轉頁面
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameTex.text?.isEmpty == false,
           birthdayTex.text?.isEmpty == false{
            return true
        }else{
            let alercontroller = UIAlertController(title: "錯誤", message: "請填入正確內容", preferredStyle: .alert)
            alercontroller.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            present(alercontroller, animated: true, completion: nil)
            return false
        }
    }
    //更新要顯示的畫面
    func updateUI(){
        if let data = data{
            nameTex.text = data.name
            birthdayTex.text = data.birthday
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

  

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
    //設定要傳的資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameTex.text ?? ""
        let birthday = birthdayTex.text ?? ""

        data = Data(name: name, birthday:birthday)
       
    }

}
