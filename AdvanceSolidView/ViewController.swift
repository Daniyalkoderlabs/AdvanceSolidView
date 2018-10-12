//
//  ViewController.swift
//  AdvanceSolidView
//
//  Created by Daniyal Yousuf on 10/12/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

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
    var dataSource: [RenderData] = [RenderData.init(inProg: false, data: nil, tag: 0),RenderData.init(inProg: false, data: nil, tag: 1),RenderData.init(inProg: false, data: nil, tag: 2),RenderData.init(inProg: false, data: nil, tag: 3),RenderData.init(inProg: false, data: nil, tag: 4),RenderData.init(inProg: false, data: nil, tag: 5),RenderData.init(inProg: false, data: nil, tag: 6),RenderData.init(inProg: false, data: nil, tag: 7),RenderData.init(inProg: false, data: nil, tag: 8)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseTableView.register(UINib.init(nibName: "RenderCell1", bundle: nil), forCellReuseIdentifier: "rendercell1")
        baseTableView.rowHeight = 292
        baseTableView.tableFooterView = UIView.init()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        guard let isCell = tableView.dequeueReusableCell(withIdentifier: "rendercell1") as? RenderCell1 else {
            
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

extension ViewController: RenderCellDelegate {
    func tapDelete(cell: UITableViewCell, currentType: RenderCellType, cellNo: Int) {
        if currentType == .NonOverLay {
            let indexPath = baseTableView.indexPath(for: cell)
            dataSource[indexPath!.row].inProgress = true
            let rendercell: RenderCell1 = cell as! RenderCell1
            rendercell.updateView(type: .Overlay)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let indexP = IndexPath.init(row: cellNo, section: 0)
                self.didShootSelector(index: indexP, cell: cell, tag: rendercell.currentData.tag)
            }
        }
    }
    
    @objc func didShootSelector(index:IndexPath, cell:UITableViewCell, tag: Int) {
        
        
        //dataSource[index.row].inProgress = false
    
        ///castedCell.updateView(type: .NonOverLay)   //updateView or Delete Cell here
        
        
        
        //let datatoberemoved = dataSource.remove(at: index.row)
        
         let matchedCell = cell as! RenderCell1
     //   let castedcell = cell as! RenderCell1
        for data in dataSource {
            
           
            
            if tag == data.tag {
                print("INDEX ROW WITH \(String(describing: matchedCell.data.tag)) has been DELETED")
                let indexPath = baseTableView.indexPath(for: matchedCell)
                let scopecell = baseTableView.cellForRow(at: IndexPath.init(item: tag, section: 0))
                dataSource.remove(at: (indexPath?.row)!)
                if (scopecell != nil) {
                    if baseTableView.visibleCells.contains(scopecell!) {
                        baseTableView.deleteRows(at: [indexPath!], with: .none)
                    } else {
                        baseTableView.reloadData()
                    }
                    
                } else {
                    baseTableView.reloadData()
                }
                
                
                break
               // baseTableView.deleteRows(at: [indexPath!], with: .none)
            }
        
        }
        
        
        //baseTableView.reloadData()
        
    }
    
    
    
}

