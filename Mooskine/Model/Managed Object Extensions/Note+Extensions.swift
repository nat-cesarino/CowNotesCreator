//
//  Note+Extensions.swift
//  Mooskine
//
//  Created by Nathalie Cesarino on 23/04/23.
//

import Foundation
import CoreData

extension Note {
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
