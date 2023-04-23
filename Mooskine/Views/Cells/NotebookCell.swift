//
//  NotebookCell.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//

import UIKit

internal final class NotebookCell: UITableViewCell, Cell {
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        pageCountLabel.text = nil
    }

}
