//
//  MovieDetailsViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var sinopseText: UITextView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    private func setup() {
        
        if let currentMovie = movie {

            self.titleLabel.text = currentMovie.title
            self.categoriesLabel.text = currentMovie.categories
            self.ratingLabel.text = "⭐️\(currentMovie.rating)/10.0"
            self.durationLabel.text = currentMovie.duration
            //self.posterImageView.image = UIImage(named: currentMovie.image)
            self.sinopseText.text = currentMovie.summary
        }
    }
}
