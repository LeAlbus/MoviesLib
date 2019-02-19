//
//  MovieRegisterViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 18/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

class MovieRegisterViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var scoreTextField: UITextField!
    @IBOutlet private weak var durationTextField: UITextField!
    @IBOutlet private weak var categoriesTextField: UITextField!
    @IBOutlet private weak var sinopseTextView: UITextView!
    
    @IBOutlet private weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentMovie = movie {
            
            self.titleTextField.text = currentMovie.title
            self.categoriesTextField.text = currentMovie.categories
            self.scoreTextField.text = "⭐️\(currentMovie.rating)/10"
            self.durationTextField.text = currentMovie.duration
            self.sinopseTextView.text = currentMovie.summary
            self.addButton.setTitle("Alterar", for: .normal)
        }
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        if movie == nil{
            movie = Movie(context: context)
        }
        
        movie?.title = self.titleTextField.text
        movie?.rating = Double(self.scoreTextField.text!) ?? 0.0
        movie?.duration = self.durationTextField.text
        movie?.summary = self.sinopseTextView.text
        movie?.categories = self.categoriesTextField.text
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch { print (error) }
    }
}
