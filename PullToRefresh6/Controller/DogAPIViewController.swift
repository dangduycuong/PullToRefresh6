//
//  DogAPIViewController.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

class DogAPIViewController: BaseViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    var infomation = NaSaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(reload))
//        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))

//        navigationItem.rightBarButtonItems = [add, play]
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func reload() {
        let link = "https://dog.ceo/api/breeds/image/random"
        
        getImage(link: link)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reload()
    }
    
    func getImage(link: String) {
        showLoading()
        
        BaseRouter.shared.getData(urlString: link, method: .get, completion: { (data: DogModel) in
            if let message = data.message {
                if let url = URL(string: message) {
                    if let image = try? Data(contentsOf: url) {
                        self.hideLoading()
                        self.dogImageView.image = UIImage(data: image)
                    }
                }
            }
        })
    }
    
    func getNaSaImage() {
        showLoading()
        let api_key = "Zk6adwC3Xmi8RoQqYCFYM4yiP1WJuXa1Y8aJxT0G"
        let params = [URLQueryItem(name: "api_key", value: api_key)]
        
        BaseRouter.shared.getData(urlString: "https://api.nasa.gov/planetary/apod", params: params, method: .get, completion: { (data: NaSaModel) in
            self.hideLoading()
            self.infomation = data
            
            if let url = data.hdurl {
                let vc = Storyboard.Main.showViewController()
                vc.url = url
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        getNaSaImage()
    }

}
