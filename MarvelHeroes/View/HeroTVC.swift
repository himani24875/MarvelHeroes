//
//  HeroTVC.swift
//  MarvelHeroes
//
//  Created by Himani on 28/10/20.
//  Copyright © 2020 Himani. All rights reserved.
//

import UIKit

class HeroTVC: UITableViewCell {
    
    @IBOutlet weak var heroImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var data: Hero? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        heroImgView.layer.borderColor = UIColor.white.cgColor
        heroImgView.layer.borderWidth = 5.0
        heroImgView.layer.cornerRadius = 10.0
    }
    
    func setData() {
        guard let hero = data else {
            return
        }
        
        nameLbl.text = hero.name
        descLbl.text = hero.desc
        setImage(for: hero.profileImg)
    }
    
    func setImage(for urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil,
            let response = response as? HTTPURLResponse, response.statusCode == 200,
            let data = data
                else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.heroImgView.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLbl.text = ""
        descLbl.text = ""
    }
}
