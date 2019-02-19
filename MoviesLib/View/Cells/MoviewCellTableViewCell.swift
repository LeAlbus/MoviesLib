//
//  MoviewCellTableViewCell.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MoviewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSinose: UILabel!
    @IBOutlet weak var lbNota: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with movie: Movie){
       // ivPoster.image = UIImage(named: movie.image)
        lbTitle.text = movie.title
        lbNota.text = "⭐️\(movie.rating)/10.0"
        lbSinose.text = movie.summary
    }
}
