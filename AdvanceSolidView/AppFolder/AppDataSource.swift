//
//  AppDataSource.swift
//  AdvanceSolidView
//
//  Created by Daniyal Yousuf on 10/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import Foundation

class AppDataSource {
    
    static func fetchRenderData() -> [RenderData] {
        let dataSource: [RenderData] =
            [
                RenderData.init(inProg: false, data: nil, tag: 0)
                ,RenderData.init(inProg: false, data: nil, tag: 1)
                ,RenderData.init(inProg: false, data: nil, tag: 2)
                ,RenderData.init(inProg: false, data: nil, tag: 3)
                ,RenderData.init(inProg: false, data: nil, tag: 4)
                ,RenderData.init(inProg: false, data: nil, tag: 5)
                ,RenderData.init(inProg: false, data: nil, tag: 6)
                ,RenderData.init(inProg: false, data: nil, tag: 7)
                ,RenderData.init(inProg: false, data: nil, tag: 8)
                ,RenderData.init(inProg: false, data: nil, tag: 9)
                ,RenderData.init(inProg: false, data: nil, tag: 10)
                ,RenderData.init(inProg: false, data: nil, tag: 11)
                ,RenderData.init(inProg: false, data: nil, tag: 12)
        ]
        return dataSource
    }
    
    
}
