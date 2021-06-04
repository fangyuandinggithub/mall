//
//  RYJRefresh.swift
//  mall
//
//  Created by fangyuan ding on 2021/5/28.
//

import Foundation
import MJRefresh

extension UIScrollView{
    var ryjHead:MJRefreshHeader{
        get{return mj_header!}
        set{mj_header = newValue}
    }
    var ryjFoot:MJRefreshFooter{
        get{return mj_footer!}
        set{mj_footer = newValue}
    }
    
}
class RYJRefreshNormalHeader: MJRefreshNormalHeader {}
