//
//  ViewController.swift
//  PracticeTable
//
//  Created by admin on 04/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var JokeArr:[JokeModel] = []
    
    var selectedJoke : JokeModel!
    
    override func viewWillAppear(_ animated: Bool) {
        ApiManager().ApiCall{res in
            switch res {
            case .success(let data):
                self.JokeArr.append(contentsOf: data)
                self.TableVC.reloadData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    

    @IBOutlet weak var TableVC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptable()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetail" {
            if let detail = segue.destination as? DetailVC {
                detail.selectedJoke = selectedJoke
            }
        }
    }
    
    
    func setuptable(){
        
        TableVC.delegate=self
        TableVC.dataSource=self
        TableVC.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JokeArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataCell
        cell.TableLabel.text=JokeArr[indexPath.row].type
        cell.setLabel.text=JokeArr[indexPath.row].setup
        cell.punchlineLable.text=JokeArr[indexPath.row].punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedJoke = JokeArr[indexPath.row]
        print(selectedJoke.setup)
        performSegue(withIdentifier: "GoToDetail", sender: self)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete"){
            action, source, completion in
            self.JokeArr.remove(at: indexPath.row)
            self.TableVC.reloadData()
        }
        let swipeconfigure = UISwipeActionsConfiguration(actions: [delete])
        swipeconfigure.performsFirstActionWithFullSwipe = false
        return swipeconfigure
    }


}

