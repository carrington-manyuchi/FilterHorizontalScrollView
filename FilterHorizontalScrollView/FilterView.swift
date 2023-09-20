//
//  FilterView.swift
//  FilterHorizontalScrollView
//
//  Created by DA MAC M1 157 on 2023/09/20.
//

import UIKit

class FilterView: UIView {
    
    var dataSource: [String] = [] {
        didSet {
            renderUI()
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        configureConstraints()
    }
    
    private func renderUI() {
        for (index, item) in dataSource.enumerated() {
            stackView.addArrangedSubview(createTokenView(index: index, item: item))
        }
    }
    
    private func configureConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        let stackViewConstraits = [
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraits)
    }
    
    private func createTokenView(index: Int, item: String) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        let textLabel = UILabel()
        textLabel.text = item
        textLabel.font = UIFont.systemFont(ofSize: 13)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        let removeButton = UIButton(type: .custom)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.tag = index
        removeButton.tintColor = .white
        removeButton.setImage(UIImage(systemName: "clear"), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        view.addSubview(removeButton)
        
        let viewConstraints = [
            textLabel.topAnchor.constraint(equalTo: view.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let removeButtonConstraints = [
            removeButton.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor),
            removeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            removeButton.heightAnchor.constraint(equalTo: view.heightAnchor),
            removeButton.widthAnchor.constraint(equalTo: removeButton.heightAnchor),
            removeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(viewConstraints)
        NSLayoutConstraint.activate(removeButtonConstraints)
        
        return view
    }
    
    @objc private func removeButtonTapped(sender: UIButton) {
        print("Button Tapped")
    }
}
