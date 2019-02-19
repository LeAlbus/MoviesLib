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
    
    var fetchedResultsController: NSFetchedResultsController<Movie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovies()
        
    }
    
    func instantiateFetchedResultsController(_ request: NSFetchRequest<Movie>){

        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.fetchedResultsController.delegate = self
 
    }
    
    func loadMovies(){
    
        let fetchedRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchedRequest.sortDescriptors = [sortDescriptor]
        
        self.instantiateFetchedResultsController(fetchedRequest)
        
        do {
            try self.fetchedResultsController.performFetch()
            
        } catch { print(error) }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let currentRow = tableView.indexPathForSelectedRow,
            let dest = segue.destination as? MovieDetailsViewController {

            let currentMovie = fetchedResultsController.object(at: currentRow)
            dest.movie = currentMovie
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let movie = fetchedResultsController.object(at: indexPath)
            context.delete(movie)
            do {
                try context.save()
            } catch { print (error) }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
      
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoviewCellTableViewCell
        
        if let fetchedResults = self.fetchedResultsController{
            let movie = fetchedResults.object(at: indexPath)
            cell?.prepare(with: movie)
        }
        
        return cell!
    }
}

extension MoviesTableViewController: NSFetchedResultsControllerDelegate{

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}
