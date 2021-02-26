//
//  REQRESViewController.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

class REQRESViewController: BaseViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var params = [URLQueryItem]()
    var listUser = [Datum]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(LISTUSERSCell.nib(), forCellReuseIdentifier: LISTUSERSCell.identifier())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        validateParams()
        callAPI()
    }
    
    func validateParams() {
        params = [
            URLQueryItem(name: "page", value: "2")
        ]
    }
    
    func callAPI() {
        let link = "https://reqres.in/api/users"
        showLoading()
        BaseRouter.shared.getData(urlString: link, params: params, method: .get, completion: { (data: ListUserModel) in
            self.hideLoading()
            self.listUser = data.data
            self.tableView.reloadData()
        })
    }
    

    //MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LISTUSERSCell.identifier(), for: indexPath) as! LISTUSERSCell
        
        cell.data = listUser[indexPath.row]
        cell.fillData()
        cell.emailLabel.text = listUser[indexPath.row].email
        
        return cell
    }

}

extension REQRESViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        title = ""
        let vc = Storyboard.Main.dogAPIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
