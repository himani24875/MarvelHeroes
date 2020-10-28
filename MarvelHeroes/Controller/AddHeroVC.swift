//
//  AddHeroVC.swift
//  MarvelHeroes
//
//  Created by Himani on 28/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import UIKit

protocol AddHeroDelegate: class {
    func addHero(hero: Hero)
}

class AddHeroVC: UIViewController {
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var imageLinkTxtField: UITextField!
    @IBOutlet weak var descrTxtView: UITextView!
    @IBOutlet weak var doneBtn: UIButton!
    
    weak var delegate: AddHeroDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        self.descrTxtView.layer.borderWidth = 1.0
        self.descrTxtView.layer.borderColor = UIColor.systemGray3.cgColor
        self.descrTxtView.layer.cornerRadius = 5.0
    }
    
    //MARK:- Button Actions
    @IBAction func doneBtnAction(_ sender: Any) {
        let hero = Hero(name: nameTxtField.text ?? "", desc: descrTxtView.text ?? "", profileImg: imageLinkTxtField.text ?? "")
        delegate.addHero(hero: hero)
        self.navigationController?.popViewController(animated: true)
    }
}
