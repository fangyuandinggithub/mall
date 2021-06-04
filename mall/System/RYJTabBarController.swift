//
//  RYJTabBarController.swift
//  mall
//
//  Created by fangyuan ding on 2021/5/27.
//

import UIKit

class RYJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        // Home
        let homeVC = RYJHomeViewController()
        addChildViewController(homeVC,
                               image: UIImage(named: "tabbar_home"),
                               selectedImage: UIImage(named: "tabbar_home_sel"),title: "首页")
        
        // Like
        let liekVC = RYJLikeViewController()
        addChildViewController(liekVC,
                               image: UIImage(named: "tabbar_like"),
                               selectedImage: UIImage(named: "tabbar_like_sel"),title: "喜欢")
        
        // Cart
        let cartVC = RYJCartViewController()
        addChildViewController(cartVC,
                               image: UIImage(named: "tabbar_cart"),
                               selectedImage: UIImage(named: "tabbar_cart_sel"),title: "购物车")
        
        // Search
        let searchVC = RYJSearchViewController()
        addChildViewController(searchVC,
                               image: UIImage(named: "tabbar_search"),
                               selectedImage: UIImage(named: "tabbar_search_sel"),title: "搜索")
        
    }
    func addChildViewController(_ childController:UIViewController,image:UIImage?,selectedImage:UIImage?,title:String?) {
        
        childController.tabBarItem = UITabBarItem(title: title, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        if UIDevice.current.userInterfaceIdiom == .phone{
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(childController)
        
    }
    


}
