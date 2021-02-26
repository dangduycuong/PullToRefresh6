//
//  ShowViewController.swift
//  PullToRefresh6
//
//  Created by Dang Duy Cuong on 2/26/21.
//  Copyright © 2021 duycuong. All rights reserved.
//

import UIKit

class ShowViewController: BaseViewController {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 0.3
            scrollView.maximumZoomScale = 2
            scrollView.delegate = self
        }
    }
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.showLoading()
        DispatchQueue.global().async {
            if let url = URL(string: "https://api.nasa.gov/planetary/earth/imagery?lon=-95.33&lat=29.78&date=2018-01-01&dim=0.15&api_key=DEMO_KEY") {
                if let image = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.hideLoading()
                        self.showImageView.image = UIImage(data: image)
                    }
                }
            }
        }
    }
    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        if scrollView.zoomScale > 1 {
//            if let image = showImageView.image {
//
//                let ratioW = showImageView.frame.width / image.size.width
//                let ratioH = showImageView.frame.height / image.size.height
//
//                let ratio = ratioW < ratioH ? ratioW : ratioH
//
//                let newWidth = image.size.width * ratio
//                let newHeight = image.size.height * ratio
//
//                let left = 0.5 * (newWidth * scrollView.zoomScale > showImageView.frame.width ? (newWidth - showImageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
//                let top = 0.5 * (newHeight * scrollView.zoomScale > showImageView.frame.height ? (newHeight - showImageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))
//
//                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
//            }
//        } else {
//            scrollView.contentInset = UIEdgeInsets.zero
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShowViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return showImageView
    }
}
