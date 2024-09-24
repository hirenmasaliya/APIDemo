//
//  ViewController.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 19/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jokes : [JokeModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        callJokes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }
    
    // Here Call Jokes Api
    
    func callJokes(){
        callJokeAPI { res in
            switch res {
            case .success(let data):
                self.jokes.append(contentsOf: data)
                self.tableView.reloadData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.txtSetup.text = jokes[indexPath.row].setup
        cell.txtPunchLine.text = jokes[indexPath.row].punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        jokes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
}

