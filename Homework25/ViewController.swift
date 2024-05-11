//
//  ViewController.swift
//  Homework25
//
//  Created by Nodiko Gachava on 11.05.24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    
    
    // MARK: - UI Components
    
    private let heartImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "heart")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let giaImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "gia")
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:  "repeat"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.end"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shuffleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.end"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pause"), for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    private let songLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "გაპატიებ"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "გიალო"
        return label
    }()
    
    private var progressView: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.trackTintColor = .systemBlue
        pv.progressTintColor = .red
       return pv
    }()
        
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - UI Setup
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(heartImage)
        self.view.addSubview(giaImage)
        self.view.addSubview(repeatButton)
        self.view.addSubview(forwardButton)
        self.view.addSubview(shuffleButton)
        self.view.addSubview(backwardButton)
        self.view.addSubview(pauseButton)
        self.view.addSubview(songLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(progressView)
        
        pauseButton.addAction(UIAction(handler: { _ in
            self.barAnimate()
        }), for: .touchUpInside)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - 20 , height: 30)
        progressView.setProgress(0, animated: false)
        
        NSLayoutConstraint.activate([
            heartImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 52),
            heartImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 107),
            
            giaImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            giaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            giaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            giaImage.widthAnchor.constraint(equalToConstant: 304),
            giaImage.heightAnchor.constraint(equalToConstant: 319),
            
            repeatButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 637),
            repeatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 331),
            repeatButton.widthAnchor.constraint(equalToConstant: 25),
            repeatButton.heightAnchor.constraint(equalToConstant: 24),
            
            forwardButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 637),
            forwardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 265),
            forwardButton.widthAnchor.constraint(equalToConstant: 25),
            forwardButton.heightAnchor.constraint(equalToConstant: 24),
            
            shuffleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 637),
            shuffleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            shuffleButton.widthAnchor.constraint(equalToConstant: 25),
            shuffleButton.heightAnchor.constraint(equalToConstant: 24),
            
            backwardButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 637),
            backwardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85.55),
            backwardButton.widthAnchor.constraint(equalToConstant: 25),
            backwardButton.heightAnchor.constraint(equalToConstant: 24),
            
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 629),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 166.48),
            pauseButton.widthAnchor.constraint(equalToConstant: 42),
            pauseButton.heightAnchor.constraint(equalToConstant: 41),
            
            songLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            songLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65),
            songLabel.heightAnchor.constraint(equalToConstant: 63),
            songLabel.widthAnchor.constraint(equalToConstant: 245),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            nameLabel.widthAnchor.constraint(equalToConstant: 245),
            
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 561),
            progressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22.07)
        ])
    }

    func barAnimate() {
        for x in 0...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(x)*0.25) , execute: {
                self.progressView.setProgress(Float(x)/100, animated: true)
            })
        }
    }

}

