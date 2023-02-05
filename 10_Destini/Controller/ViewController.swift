//
//  ViewController.swift
//  10_Destini
//
//  Created by pvl kzntsv on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var storyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        return label
    }()
    
    private lazy var choice1Butoon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        return button
    }()
    
    private lazy var choice2Butoon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        return button
    }()
    
    
    func setupUI() {
        textView.addSubview(storyTextLabel)
        view.addSubview(textView)
        view.addSubview(choice1Butoon)
        view.addSubview(choice2Butoon)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            storyTextLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
            
            
        ]
        )
    }
    
    
    func choiceButtonPressed(_ sender: UIButton) {
        
    }
    
    func updateUI() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

