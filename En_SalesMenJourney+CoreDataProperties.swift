//
//  En_SalesMenJourney+CoreDataProperties.swift
//  
//
//  Created by MCA 2 on 02/10/18.
//
//

import Foundation
import CoreData


extension En_SalesMenJourney {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<En_SalesMenJourney> {
        return NSFetchRequest<En_SalesMenJourney>(entityName: "En_SalesMenJourney")
    }

    @NSManaged public var salesman_id: Int64
    @NSManaged public var socketId: String?
    @NSManaged public var user_id: Int64
    @NSManaged public var user_type_id: Int64
    @NSManaged public var comp_id: Int64
    @NSManaged public var org_id: Int64
    @NSManaged public var user_fname: String?
    @NSManaged public var lat: String?
    @NSManaged public var long: String?
    @NSManaged public var isOffline: Bool
    @NSManaged public var time: String?

}
