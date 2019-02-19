//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

class MoviesTableViewController: UITableViewController {
    
    var movies: [Movie] = []
    var fetchedResultsController: NSFetchedResultsController<Movie>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovies()
        
    }
    
    func loadMovies(){
    
        let fetchedRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchedRequest.sortDescriptors = [sortDescriptor]
        
        
        
//        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {
//            return
//        }
//
//        do{
//            let jsonData  = try Data(contentsOf: jsonURL)
//
//            //let jsonDecoder = JSONDecoder()
//            //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            movies = try JSONDecoder().decode([Movie].self, from: jsonData)
//
//
//
//            movies.forEach{(movie) in
//                print(movie.title)
//            }
//
//        }catch{
//            print(error)
//        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let currentRow = tableView.indexPathForSelectedRow?.row,
            let dest = segue.destination as? MovieDetailsViewController {

            let currentMovie = movies[currentRow]
            dest.movie = currentMovie
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return movies.count
      
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoviewCellTableViewCell
        
        let movie = movies[indexPath.row]
        cell?.prepare(with: movie)
        
        return cell!
    }
    
    

}
