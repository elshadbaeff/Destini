//
//  ViewController.swift
//  Destini
//
//  Created by Elshad Babaev on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let choice1Button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("False", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 0/255, green: 206/255, blue: 209/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let choice2Button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("False", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 104/255, green: 105/255, blue: 209/255, alpha: 1)
        button.tintColor = .white
        button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(storyLabel)
        view.addSubview(choice1Button)
        view.addSubview(choice2Button)
        
        updateUI()
        
        NSLayoutConstraint.activate([
            
            storyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            storyLabel.bottomAnchor.constraint(equalTo: choice1Button.topAnchor, constant: -25),
            
            choice1Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            choice1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice1Button.widthAnchor.constraint(equalToConstant: 350),
            
            choice2Button.bottomAnchor.constraint(equalTo: choice1Button.topAnchor, constant: -25),
            choice2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choice2Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    @objc func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
        
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
}

