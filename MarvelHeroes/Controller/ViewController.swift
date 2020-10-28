//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Himani on 28/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = MarvelVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        regigsterCell()
        viewModel.getHeroList()
        
        tableView.tableFooterView = UIView()
    }
    
    private func regigsterCell() {
        let nib = UINib(nibName: String(describing: HeroTVC.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: HeroTVC.self))
    }
    
    //MARK:- Button Actions
    @IBAction func addBtnAction(_ sender: Any) {
        let addHeroVC = self.storyboard?.instantiateViewController(identifier: String(describing: AddHeroVC.self)) as! AddHeroVC
        addHeroVC.delegate = self
        addHeroVC.providesPresentationContextTransitionStyle = true
        addHeroVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.pushViewController(addHeroVC, animated: true)
    }
}

//MARK:- UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeroTVC.self), for: indexPath) as! HeroTVC
        cell.data = viewModel.heroes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.heroes.remove(at: indexPath.row)
            viewModel.deleteHeroFromTheList(index: indexPath.row)
            tableView.reloadData()
        }
    }
}

//MARK:- AddHeroDelegate
extension ViewController: AddHeroDelegate {
    func addHero(hero: Hero) {
        viewModel.add(hero: hero)
        tableView.reloadData()
    }
}
