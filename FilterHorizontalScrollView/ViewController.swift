//
//  ViewController.swift
//  FilterHorizontalScrollView
//
//  Created by DA MAC M1 157 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    let filterDataSource = ["Sunday", "Monday", "Tuesday", "Wednesdday", "Thursday", "Friday", "Saturday"]
    
    private let filterView: FilterView = {
        let view = FilterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        filterView.dataSource = filterDataSource
        view.addSubview(filterView)
        configureConstraints()
        view.backgroundColor = .systemBackground
        
    }
    private func configureConstraints() {
        
        let filterViewConstraints = [
            filterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            filterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filterView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(filterViewConstraints)
    }
}

