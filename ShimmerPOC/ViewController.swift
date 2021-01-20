//
//  ViewController.swift
//  ShimmerPOC
//
//  Created by lucas.lima on 12/01/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var album: UILabel!
    
    @IBOutlet weak var imageStack: UIImageView!
    @IBOutlet weak var musicNameStack: UILabel!
    @IBOutlet weak var artistStack: UILabel!
    @IBOutlet weak var albumStack: UILabel!
    
    @IBOutlet weak var shimmerTableview: UITableView!
    
    @IBOutlet weak var switchShimmer: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        image.layer.cornerRadius = image.frame.height/2
        
        imageStack.layer.cornerRadius = image.frame.height/2
        image.skeletonCornerRadius = Float(image.frame.height/2)
        imageStack.skeletonCornerRadius = Float(image.frame.height/2)
        shimmerTableview.dataSource = self
        shimmerTableview.delegate = self
        
        
        shimmerTableview.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    @IBAction func changedState(_ sender: Any) {
        stopLoadingView(switchShimmer.isOn, view: image)
        stopLoadingView(switchShimmer.isOn, view: imageStack)
        stopLoadingView(switchShimmer.isOn, view: musicName)
        stopLoadingView(switchShimmer.isOn, view: musicNameStack)
        stopLoadingView(switchShimmer.isOn, view: artist)
        stopLoadingView(switchShimmer.isOn, view: artistStack)
        stopLoadingView(switchShimmer.isOn, view: album)
        stopLoadingView(switchShimmer.isOn, view: albumStack)
        shimmerTableview.reloadData()
    }
    
    private func stopLoadingView(_ isEnable: Bool, view: UIView) {
        if isEnable {
            view.hideSkeleton()
        } else {
            view.showAnimatedSkeleton()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return switchShimmer.isOn ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell {
            cell.isSkeletoned(!switchShimmer.isOn)
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
