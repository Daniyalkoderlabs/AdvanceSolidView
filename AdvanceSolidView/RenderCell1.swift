//
//  RenderCell1.swift
//  AdvanceSolidView
//
//  Created by Daniyal Yousuf on 10/12/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

enum RenderCellType: Int {
    case Overlay = 0, NonOverLay
}


protocol RenderCellDelegate {
    
    func tapDelete(cell:UITableViewCell, currentType:RenderCellType, cellNo:Int)
}

class RenderCell1: UITableViewCell {
    
    //Overlay View Properties
    @IBOutlet weak var viewOverlay: UIView!
    
    @IBOutlet  weak var lblTitle: UILabel!
    @IBOutlet weak var indicatorAcitivity: UIActivityIndicatorView!
    var currentType: RenderCellType!
    var currentData: RenderData!
    //
    var delegate: RenderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var data:RenderData {
        return currentData
    }
    
    @IBAction func didTappedDelete(_ sender: UIButton) {
        self.delegate?.tapDelete(cell: self, currentType: currentType, cellNo: self.tag)
       // self.delegate?.didTapDelete(cell: self, currentType: currentType)
        
    }
    
    func bindData(data:RenderData) {
        currentData = data
        lblTitle.text = "This is cell no \(String(describing: currentData.tag))"
        if data.inProgress {
            self.updateView(type: .Overlay)
        } else {
            self.updateView(type: .NonOverLay)
        }
        
    }
    
    
    func updateView(type:RenderCellType) {
        currentType = type
        self.update(type: type)
        
    }
    
    private func update(type:RenderCellType) {
        
        if type == .Overlay {
            self.presentOverlay()
        } else {
            self.hideOverlay()
        }
        
    }
    
    private func presentOverlay() {
        viewOverlay.isHidden = false
        indicatorAcitivity.startAnimating()
    }
    
   private func hideOverlay() {
        
        viewOverlay.isHidden = true
        indicatorAcitivity.stopAnimating()
        
    }
    
}
