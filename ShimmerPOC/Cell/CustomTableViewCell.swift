//
//  CustomTableViewCell.swift
//  ShimmerPOC
//
//  Created by lucas.lima on 18/01/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit
import SkeletonView

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var covertImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var covertName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        covertImage.layer.cornerRadius = covertImage.frame.height/2
        covertImage.skeletonCornerRadius = Float(covertImage.frame.height/2)
    }
    
    func isSkeletoned(_ isLoading: Bool) {
        animate(isLoading, view: covertImage)
        animate(isLoading, view: musicName)
        animate(isLoading, view: covertName)
        animate(isLoading, view: artistName)
    }
    
    private func animate(_ isLoading: Bool, view: UIView) {
        if isLoading {
            view.showAnimatedSkeleton()
        } else {
            view.hideSkeleton()
        }
    }
    
}
