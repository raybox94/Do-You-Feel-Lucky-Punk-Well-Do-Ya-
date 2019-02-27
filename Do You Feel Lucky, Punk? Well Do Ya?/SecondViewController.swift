//
//  SecondViewController.swift
//  Do You Feel Lucky, Punk? Well Do Ya?
//
//  Created by rayaan on 26/02/19.
//  Copyright © 2019 Northwest. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history")!
        cell.textLabel?.text = String("Correct Answer :\(Guesser.shared.guess(index:indexPath.row).correctAnswer)")
        cell.detailTextLabel?.text = String("# Attempts: \(Guesser.shared.guess(index: indexPath.row).numAttemptsRequired)")
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadView()
        // Do any additional setup after loading the view, typically from a nib.
    }//end of method viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
}//end of class

