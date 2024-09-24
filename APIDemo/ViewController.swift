//
//  ViewController.swift
//  APIDemo
//
//  Created by Hiren Masaliya on 19/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var loader: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    var jokes : [JokeModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callJokes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupLoader()
    }
    
    func setupLoader() {
            loader.center = view.center
            loader.hidesWhenStopped = true // This will automatically hide the loader when you stop it
            view.addSubview(loader)
        }
    
    // Here Call Jokes Api
    func callJokes(){
        loader.startAnimating()
        callJokeAPI { res in
            self.loader.stopAnimating()
            
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
        return 70
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let messageAction = UIContextualAction(style: .normal, title: "Message") { (action, view, completionHandler) in
            print("Left Swipe")
            completionHandler(true)
        }
        
        messageAction.backgroundColor = .systemBlue
        
        let configuration = UISwipeActionsConfiguration(actions: [messageAction])
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        jokes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    
}

