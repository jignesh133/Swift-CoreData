//
//  En_SalesMenJourney+CoreDataClass.swift
//  
//
//  Created by MCA 2 on 02/10/18.
//
//

import Foundation
import CoreData

@objc(En_SalesMenJourney)
public class En_SalesMenJourney: NSManagedObject {
    
    static let myContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    static let myEntity = NSEntityDescription.entity(forEntityName: "En_SalesMenJourney", in:myContext)!
    
    
    @nonobjc public class func createJourneyEntry(dataDict: NSDictionary){
        
        let tmpEntity =  En_SalesMenJourney(entity: myEntity, insertInto: myContext)
        
        tmpEntity.salesman_id = getInt64FromAny(dataDict["salesman_id"])
        tmpEntity.socketId = dataDict.value(forKey: "socketId") as? String ?? ""
        tmpEntity.user_id = getInt64FromAny(dataDict["user_id"])
        tmpEntity.user_type_id = getInt64FromAny(dataDict.value(forKey: "user_type_id") ?? 0)
        tmpEntity.comp_id = getInt64FromAny(dataDict.value(forKey: "comp_id") ?? 0)
        tmpEntity.user_fname = dataDict.value(forKey: "user_fname") as? String ?? ""
        tmpEntity.lat = dataDict.value(forKey: "user_fname") as? String ?? ""
        tmpEntity.long = dataDict.value(forKey: "user_fname") as? String ?? ""
        tmpEntity.isOffline = dataDict["isOffline"] as? Bool ?? false
        tmpEntity.time = dataDict.value(forKey: "time") as? String ?? ""
       
        do {
            try myContext.save()
        } catch _ {
            print("Error while inserting order data in db")
        }
    }
    
    @nonobjc public class func fetch_OfflineData() -> [En_SalesMenJourney]? {
        
        let fetchRequest = NSFetchRequest<En_SalesMenJourney>(entityName: "En_SalesMenJourney")
        let predicate = NSPredicate(format: "isOffline == %@",NSNumber.init(value: true))
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false
       
        do {
            let items = try myContext.fetch(fetchRequest)
            return items
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    @nonobjc public class func deleteData() {
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>()
        fetchReq.entity = myEntity
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchReq)
        do {
            try (UIApplication.shared.delegate as! AppDelegate).persistentStoreCoordinator.execute(deleteRequest, with: myContext)
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        
        do {
            try myContext.save()
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
    }

}
