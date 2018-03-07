//
//  WTMainPageViewController.swift
//  DTWallet
//
//  Created by 张长乐 on 2018/3/5.
//  Copyright © 2018年 张长乐. All rights reserved.
//

import UIKit

class WTMainPageViewController: UIViewController {

    var tableiView: UITableView?
    let outBtn = UIButton(type: .custom)
    let inBtn  = UIButton(type: .custom)
    let tableHeaderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        customLayout()
    }
    
    func makeUI() {
        navigationItem.title = "以太坊ETH"
        view.backgroundColor = UIColor.red
        
        self.automaticallyAdjustsScrollViewInsets = false;
        edgesForExtendedLayout = .all
        
        outBtn.setTitle("转出", for: .normal)
        view.addSubview(outBtn)

        inBtn.setTitle("转入", for: .normal)
        view.addSubview(inBtn)
        
        tableiView = UITableView(frame: view.bounds, style: .plain)
        tableiView!.dataSource = self
        tableiView!.delegate = self
        view.addSubview(tableiView!)
        
        tableiView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableHeaderView.backgroundColor = UIColor.yellow
        tableiView?.tableHeaderView = tableHeaderView
    }
    
    func customLayout() {
        
        tableHeaderView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        tableiView?.layoutIfNeeded()
        
        outBtn.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(0)
            make.height.equalTo(50)
            make.right.equalTo(inBtn.snp.left)
        }
        
        inBtn.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(0)
            make.height.equalTo(outBtn.snp.height)
            make.width.equalTo(outBtn.snp.width)
        }
        
        tableiView?.snp.makeConstraints{ (make) in
            make.top.left.right.equalToSuperview().offset(0)
            make.bottom.equalTo(outBtn.snp.top)
        }
        
        
    }
}

// MARK:- UITableViewDelegate
extension WTMainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}

// MARK:- UITableViewDataSource
extension WTMainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableiView?.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "交易记录"
    }
    
}

