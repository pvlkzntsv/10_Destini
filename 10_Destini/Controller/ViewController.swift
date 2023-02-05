//
//  ViewController.swift
//  10_Destini
//
//  Created by pvl kzntsv on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var storyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 25)
        label.textColor = .white
        label.text = "story text placeholder"
        label.contentMode = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        
        return label
    }()
    
    private lazy var choice1Butoon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.addAction(UIAction {_ in self.choiceButtonPressed(button)}, for: .touchUpInside)
        return button
    }()
    
    private lazy var choice2Butoon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.addAction(UIAction {_ in self.choiceButtonPressed(button)}, for: .touchUpInside)
        return button
    }()
    
    
    func setupUI() {
        textView.addSubview(storyTextLabel)
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(choice1Butoon)
        view.addSubview(choice2Butoon)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -1),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.80),
            
            storyTextLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
            storyTextLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 20),
            storyTextLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -20),
            
            choice1Butoon.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            choice1Butoon.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            choice1Butoon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            choice2Butoon.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            choice2Butoon.topAnchor.constraint(equalTo: choice1Butoon.bottomAnchor, constant: 5),
            choice2Butoon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            
        ]
        )
    }
    
    
    func choiceButtonPressed(_ sender: UIButton) {
        guard let userChoice = sender.titleLabel?.text else {return}
        storyBrain.nextStory(choice: userChoice)
        updateUI()
    }
    
    func updateUI() {
        storyTextLabel.text = storyBrain.getStoryTitle()
        choice1Butoon.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Butoon.setTitle(storyBrain.getChoice2(), for: .normal)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }


}

