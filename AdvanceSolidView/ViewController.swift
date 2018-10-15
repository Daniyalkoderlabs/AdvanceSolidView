//
//  ViewController.swift
//  AdvanceSolidView
//
//  Created by Daniyal Yousuf on 10/12/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol:UITableViewDataSource, UITableViewDelegate, RenderCellDelegate { }

struct RenderData {
    var inProgress:Bool!
    var cdata:[String:AnyObject]?
    var tag:Int!
    init(inProg:Bool, data:[String:AnyObject]?, tag:Int) {
        self.inProgress = inProg
        self.cdata = data
        self.tag = tag
    }
}

class ViewController: UIViewController {
    var tableCells: [RenderCell1] = []
    @IBOutlet weak var baseTableView: UITableView!
    var dataSource: [RenderData] = AppDataSource.fetchRenderData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseTableView.register(UINib.init(nibName: AppEnum.Nib.Rendercell.rawValue, bundle: nil), forCellReuseIdentifier: AppConstant.CELL_CONSTANT_DIR.RENDERCELL)
        baseTableView.rowHeight = 292
        baseTableView.tableFooterView = UIView.init()
    }
}

extension ViewController: ViewControllerProtocol {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        guard let isCell = tableView.dequeueReusableCell(withIdentifier: AppConstant.CELL_CONSTANT_DIR.RENDERCELL) as? RenderCell1 else {
            fatalError()
        }
        isCell.delegate = self
        isCell.bindData(data:dataSource[indexPath.row])

        return isCell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}

extension ViewController {
    
    func tapDelete(cell: UITableViewCell, currentType: RenderCellType, cellNo: Int, data: RenderData) {
        if currentType == .NonOverLay {
            let indexPath = baseTableView.indexPath(for: cell)
            dataSource[indexPath!.row].inProgress = true
            let rendercell: RenderCell1 = cell as! RenderCell1
            rendercell.updateView(type: .Overlay)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let indexP = IndexPath.init(row: cellNo, section: 0)
                self.didShootSelector(index: indexP, cell: cell, tag: rendercell.currentData.tag, data: data as AnyObject)
            }
        }
    }
    
    func getIndex(data:RenderData) -> Int? {
    
        for (index,element) in dataSource.enumerated() {
            if element.tag == data.tag {
                return index
            }
            
        }
        return nil
        
    }
    
    @objc func didShootSelector(index:IndexPath, cell:UITableViewCell, tag: Int, data:AnyObject) {
        
        
        let castedRenderObj: RenderData = data as! RenderData
        if let index = getIndex(data: castedRenderObj) {
            
            print("INDEX ROW WITH \(String(describing: dataSource[index].tag)) has been DELETED")
            dataSource.remove(at: index)
            
            let indexPath = IndexPath.init(item: index, section: 0)
            baseTableView.deleteRows(at: [indexPath], with: .none)

        }
        
    }
    
    
    
    
}

