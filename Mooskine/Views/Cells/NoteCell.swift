//
//  NoteCell.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//

import UIKit

internal final class NoteCell: UITableViewCell, Cell {
    // Outlets
    @IBOutlet weak var textPreviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        textPreviewLabel.text = nil
        dateLabel.text = nil
    }
}
