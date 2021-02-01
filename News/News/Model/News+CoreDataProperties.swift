//
//  News+CoreDataProperties.swift
//  News
//
//  Created by PavanaKC on 01/02/21.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var author: String?
    @NSManaged public var explanation: String?
    @NSManaged public var headline: String?

}

extension News : Identifiable {

}
