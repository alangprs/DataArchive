//
//  listTableViewController.swift
//  練習
//
//  Created by 翁燮羽 on 2021/6/6.
//

import UIKit

class listTableViewController: UITableViewController {
    
    var datas = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
     
            //如果有讀到要解析的資料，將解好的資料存回datas裡面
            if let untieData = Data.untieData(){
                self.datas = untieData
            }
        
    }
    //判斷跳到下一頁時，是新增資料還是修改資料
    @IBAction func unwindToLustTable(_ unwindSegue: UIStoryboardSegue) {
        //如果有讀到轉型成editTableViewController的資料、data的資料
        if let source = unwindSegue.source as? editTableViewController,
           let data = source.data{ //先確定有抓到起點資料
            //判斷，點選的cell裡有資料 代表是要傳資料過去修改
            if let indexPath = tableView.indexPathForSelectedRow{
                datas[indexPath.row] = data
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }else{
                datas.insert(data, at: 0) //將抓到的資料放在array第一個
                //新增資料的動畫
                let indexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        Data.loadData(datas) //儲存資料
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "show", for: indexPath)
        let row = datas[indexPath.row]
        cell.textLabel?.text = row.name
        cell.detailTextLabel?.text = row.birthday
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    //刪除的動畫
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        datas.remove(at: indexPath.row)
        tableView.reloadData()
        Data.loadData(datas)
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

    
    //使用prepare傳cell資料到下一頁修改
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? editTableViewController, //選擇要去的終點
           let row = tableView.indexPathForSelectedRow?.row{ //如果選到的cell有資料 代表要傳資料到下一頁修改資料
            controller.data = datas[row] //將這頁cell選到的資料傳到下一頁的data
        }
    }
    

}
