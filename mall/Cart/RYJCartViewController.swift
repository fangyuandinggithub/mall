//
//  RYJCartViewController.swift
//  mall
//
//  Created by fangyuan ding on 2021/5/27.
//

import UIKit

class RYJCartViewController: RYJBaseViewController {
    lazy var discountView : RYJCartDiscountView = {
        let discountView = RYJCartDiscountView.init(frame: CGRect.zero)
        return discountView
        
    }()
    lazy var settlementView: RYJCartSettlementView = {
        let settlementView = RYJCartSettlementView.init(frame: CGRect.zero)
        return settlementView
    }()
    lazy var listView:RYJCartListView = {
        let listView = RYJCartListView.init(frame: CGRect.zero)
        listView.productData = productData
        listView.tableView.ryjHead = RYJRefreshNormalHeader{
            [weak self] in self?.loadData()
            
        }
        return listView
    }()
    lazy var productData:Array<RYJCartModel> = {
        let data = RYJCartModel.defaultData()
        return data
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //计算总价
        calcaulateTotalPrice()
        //删除产品的回调
        listView.editingDeleteBlock = {
            [weak self] in self?.deleteProduct(indexPath:$0)
        }
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //列表左滑删除
        listView.addDeleteButton()
    }
    func setupUI(){
        self.titleLabel.text = "Cart"
        self.view.addSubview(discountView)
        discountView.snp.makeConstraints {
            $0.left.equalTo(self.view.snp.left).offset(20)
            $0.top.equalTo(self.titleLine.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-20)
            $0.height.equalTo(80)
        }
        settlementView.settlementClickBlock = {
            [weak self] in
            let detailVC = RYJCheckoutViewController.init()
            detailVC.modalPresentationStyle = .fullScreen
            self?.present(detailVC, animated: true, completion: {})
        }
        self.view.addSubview(settlementView)
        settlementView.snp.makeConstraints{
            $0.left.right.bottom.equalTo(self.view)
            $0.height.equalTo(60)
        }
        self.view.addSubview(listView)
        listView.snp.makeConstraints{
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(discountView.snp.bottom).offset(10)
            $0.bottom.equalTo(settlementView.snp.top)
        }
        
    }
    func deleteProduct(indexPath:IndexPath)  {
        self.productData.remove(at: indexPath.row)
        self.listView.productData = self.productData
        self.listView.tableView.deleteRows(at: [indexPath], with: .automatic)
        //从新计算价格
    }
    func calcaulateTotalPrice(){
        var totalPrice = 0.0
        for model in self.productData{
            totalPrice += Double(model.pdPrice!)!
        }
        settlementView.settlementButton.setTitle("$\(totalPrice)", for: .normal)
        
    }
    func loadData(){
        self.productData = RYJCartModel.defaultData()
        self.listView.productData = self.productData
        self.listView.tableView.reloadData()
        calcaulateTotalPrice()
        self.listView.tableView.ryjHead.endRefreshing ()
        
    }

    
    
    
}
