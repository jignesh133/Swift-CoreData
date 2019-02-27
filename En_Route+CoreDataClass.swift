//
//  En_Route+CoreDataClass.swift
//  OrangeWill
//
//  Created by Hupp Technologies on 06/07/17.
//  Copyright © 2017 Hupp Technologies. All rights reserved.
//

import Foundation
import CoreData

@objc(En_Route)
public class En_Route: NSManagedObject {
    static let myContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    static let myEntity = NSEntityDescription.entity(forEntityName: "En_Route", in:myContext)!
    
    @nonobjc public class func insertRouteData(dataDict: NSDictionary) {

        var infoDict = NSDictionary()
        infoDict = dataDict

        let tmpEntity =  En_Route(entity: myEntity, insertInto: myContext)
        tmpEntity.user_fname = infoDict.value(forKey: "user_fname") as? String ?? ""
        tmpEntity.customerlst = infoDict.value(forKey: "customerlst") as? [Dictionary<String, Any>] ?? []
        tmpEntity.assignsalesreplst = infoDict.value(forKey: "assignsalesreplst") as? [Dictionary<String, Any>] ?? []
        tmpEntity.unassigncustomerlst = infoDict.value(forKey: "unassigncustomerlst") as? NSArray ?? nil
        tmpEntity.status_name = infoDict.value(forKey: "status_name") as? String ?? ""
        
        //tmpEntity.visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "visit_count") ?? 0))
        //tmpEntity.total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "total_price") ?? 0))
        //tmpEntity.order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "total_order_count") ?? 0))
        
        tmpEntity.daily_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_visit_count") ?? 0))
        tmpEntity.daily_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_order_count") ?? 0))
        tmpEntity.daily_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_total_price") ?? 0))
        
        tmpEntity.weekly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_visit_count") ?? 0))
        tmpEntity.weekly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_order_count") ?? 0))
        tmpEntity.weekly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_total_price") ?? 0))
        
        tmpEntity.monthly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_visit_count") ?? 0))
        tmpEntity.monthly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_order_count") ?? 0))
        tmpEntity.monthly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_total_price") ?? 0))
        
        tmpEntity.yearly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_visit_count") ?? 0))
        tmpEntity.yearly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_order_count") ?? 0))
        tmpEntity.yearly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_total_price") ?? 0))
        
        if let id = infoDict.value(forKey: "org_id"){
            tmpEntity.org_id = Int64(getIntegerFromAny(id))
        }
        if let id = infoDict.value(forKey: "route_id"){
            tmpEntity.route_id = Int64(getIntegerFromAny(id))
        }
        if let name = infoDict.value(forKey: "route_name") as? String {
            tmpEntity.route_name = name
        }
        if let addedById = infoDict.value(forKey: "add_by"){
            tmpEntity.add_by = Int64(getIntegerFromAny(addedById))
        }
        if let firstlatter = infoDict.value(forKey: "first_letter") as? String {
            tmpEntity.first_letter = firstlatter
        }
        if let status = dataDict.value(forKey: "route_status") {
            tmpEntity.route_status = status as? String ?? ""
        }
        if let statusName = infoDict.value(forKey: "status_name")  {
            tmpEntity.status_name = statusName as? String ?? ""
        }
        if let add_dt = infoDict.value(forKey: "add_dt") as? String {
            tmpEntity.add_dt = add_dt
        }
        if let usernName = infoDict.value(forKey: "user_fname") as? String {
            tmpEntity.user_fname = usernName
        }

        
        if let issync = infoDict.value(forKey: "isSync") as? Bool {
            tmpEntity.isSync = issync
        }

        tmpEntity.sort_key = "\(Int(Date().timeIntervalSince1970))"
    
        do {
            try myContext.save()
        } catch _ {
            // Handle error
            return
        }
    
    }
    
    
    //MARK:- UPDATE DATA
    @nonobjc public class func Update_Data(Id:Int64,infoDict:NSDictionary) ->Bool {
        
        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        let predicate = NSPredicate(format: "route_id == \(Id)")
        fetchRequest.predicate = predicate
        
        do {
            let items = try myContext.fetch(fetchRequest)
            if items.count == 0{
                return false
            }else{
                guard let tmpEntity = items.first else {return false}
                
                tmpEntity.user_fname = infoDict.value(forKey: "user_fname") as? String ?? ""
                tmpEntity.customerlst = infoDict.value(forKey: "customerlst") as? [Dictionary<String, Any>] ?? []
                tmpEntity.assignsalesreplst = infoDict.value(forKey: "assignsalesreplst") as? [Dictionary<String, Any>] ?? []
                //tmpEntity.visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "visit_count") ?? 0))
                //tmpEntity.total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "total_price") ?? 0))
                //tmpEntity.order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "total_order_count") ?? 0))
                
                tmpEntity.daily_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_visit_count") ?? 0))
                tmpEntity.daily_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_order_count") ?? 0))
                tmpEntity.daily_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_total_price") ?? 0))
                
                tmpEntity.weekly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_visit_count") ?? 0))
                tmpEntity.weekly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_order_count") ?? 0))
                tmpEntity.weekly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_total_price") ?? 0))
                
                tmpEntity.monthly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_visit_count") ?? 0))
                tmpEntity.monthly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_order_count") ?? 0))
                tmpEntity.monthly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_total_price") ?? 0))
                
                tmpEntity.yearly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_visit_count") ?? 0))
                tmpEntity.yearly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_order_count") ?? 0))
                tmpEntity.yearly_total_price = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_total_price") ?? 0))
                
                
                if let id = infoDict.value(forKey: "org_id"){
                    tmpEntity.org_id = Int64(getIntegerFromAny(id))
                }
                if let id = infoDict.value(forKey: "route_id"){
                    tmpEntity.route_id = Int64(getIntegerFromAny(id))
                }
                if let name = infoDict.value(forKey: "route_name") as? String {
                    tmpEntity.route_name = name
                }
                if let addedById = infoDict.value(forKey: "add_by"){
                    tmpEntity.add_by = Int64(getIntegerFromAny(addedById))
                }
                if let firstlatter = infoDict.value(forKey: "first_letter") as? String {
                    tmpEntity.first_letter = firstlatter
                }
                if let status = infoDict.value(forKey: "route_status") {
                    tmpEntity.route_status = status as? String ?? ""
                }
                if let statusName = infoDict.value(forKey: "status_name")  {
                    tmpEntity.status_name = statusName as? String ?? ""
                }
                if let add_dt = infoDict.value(forKey: "add_dt") as? String {
                    tmpEntity.add_dt = add_dt
                }
                if let usernName = infoDict.value(forKey: "user_fname") as? String {
                    tmpEntity.user_fname = usernName
                }
                if let issync = infoDict.value(forKey: "isSync") as? Bool {
                    tmpEntity.isSync = issync
                }
                
                
                do {
                    try myContext.save()
                } catch {}
                return true
            }
            
        }catch {}
        
        return false
    }
    
    @nonobjc public class func fetchRouteWithOrdId(_ ordid:Int64) -> [En_Route] {
        
        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        let predicate = NSPredicate(format: "org_id == \(ordid)")
        fetchRequest.predicate = predicate
        let mySort = NSSortDescriptor(key: "sort_key", ascending: false)
        fetchRequest.sortDescriptors = [mySort]
        
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        return []
    }
    
    @nonobjc public class func fetchRoutesWithStatus(_ ordid:Int64 , _ status:String) -> [En_Route] {

        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        
        let predicate1 = NSPredicate(format: "org_id == %d",ordid)
        let predicate2 = NSPredicate(format: "status_name == %@",status)
        
        let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
      //  let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1])

        fetchRequest.predicate = predicateCompound
        
        let mySort = NSSortDescriptor(key: "route_id", ascending: false)
        fetchRequest.sortDescriptors = [mySort]
        
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
         } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        
        return []
    }
    // MARK: COUNT THE ROUTES
    @nonobjc public class func fetchRoutesCountWithStatus(_ ordid:Int64 , _ status:String) -> Int {
        
        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        
        let predicate1 = NSPredicate(format: "org_id == %d",ordid)
        let predicate2 = NSPredicate(format: "status_name == %@",status)
        
        let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        
        fetchRequest.predicate = predicateCompound
        
        let mySort = NSSortDescriptor(key: "route_id", ascending: false)
        fetchRequest.sortDescriptors = [mySort]
        
        do {
            let fetchedResultsCount = try myContext.count(for: fetchRequest)
            return fetchedResultsCount
        } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        
        return 0
    }
    
    @nonobjc public class func fetchRouteDataWithId(_ rId:Int64) -> En_Route? {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate = NSPredicate(format: "route_id == \(rId)")
        fetchRequest.predicate = predicate
        
        do {
            let items = try context.fetch(fetchRequest)
            if items.count == 0{
                return nil
            }
            return (items.last as! En_Route)
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }

    @nonobjc private class func getById(id: NSManagedObjectID) -> En_Route? {
        return myContext.object(with: id) as? En_Route
    }
    
    @nonobjc public class func UpdateRouteWithId(_ rId:Int64,dataDict:NSDictionary) {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate = NSPredicate(format: "route_id == \(rId)")
        fetchRequest.predicate = predicate
        do {
            let items = try context.fetch(fetchRequest)
            if items.count != 0{
                let route = items[0] as! En_Route
                if let id = dataDict.value(forKey: "org_id"){
                    route.org_id = Int64(getIntegerFromAny(id))
                }
                if let name = dataDict.value(forKey: "route_name") as? String {
                    route.route_name = name
                }
                if let addedById = dataDict.value(forKey: "add_by") {
                    route.add_by = Int64(getIntegerFromAny(addedById))
                }
                if let status = dataDict.value(forKey: "route_status") {
                    route.route_status = status as? String ?? ""
                }
                if let statusName = dataDict.value(forKey: "status_name") as? String {
                    route.status_name = statusName
                }
                if let add_dt = dataDict.value(forKey: "add_dt") as? String {
                    route.add_dt = add_dt
                }
                if let issync = dataDict.value(forKey: "isSync") as? Bool {
                    route.isSync = issync
                }
                route.sort_key = "\(Int(Date().timeIntervalSince1970))"
                do {
                    try myContext.save()
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }
            }
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
    }
    //MARK:- FETCH ROUTE active list WITH PAGING WITH SEARCH TEXT
    @nonobjc public class func Route_ActiveListWithSearchTextOffset(Org_id:Int,sortedData:Bool,lastIndex:Int,searchText:String,_ status:String) -> [En_Route]? {
        
         var data = [En_Route]()
        
        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        fetchRequest.fetchLimit = WebAccess.paginingSize
        fetchRequest.fetchOffset = lastIndex
        fetchRequest.returnsObjectsAsFaults = false
        
        let predicate1 = NSPredicate(format: "org_id == %d",Org_id)
        let predicate2 = NSPredicate(format: "status_name == %@",status)
        let predicate3 = NSPredicate(format: "route_name contains[c] %@",searchText)
        
        
        var predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        if searchText.isEmpty == false{
             predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2,predicate3])
        }
        //  let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1])
        
        fetchRequest.predicate = predicateCompound
        
        let mySort = NSSortDescriptor(key: "route_id", ascending: false)
        fetchRequest.sortDescriptors = [mySort]
        
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            for i in 0..<min(WebAccess.paginingSize,fetchedResults.count){
                                data.append(fetchedResults[i])
            }
            return data
        } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        
        return []
        
//        var fetchedResults = [En_Route]()
//        var data = [En_Route]()
//        let context:NSManagedObjectContext = myContext
//
//        let objRequest = NSFetchRequest<NSFetchRequestResult>()
//        objRequest.entity = myEntity
//        objRequest.fetchLimit = WebAccess.paginingSize
//        objRequest.fetchOffset = lastIndex
//        objRequest.returnsObjectsAsFaults = false
//
//        var myPredicate = NSPredicate.init()
//
//        if searchText.isEmpty{
//            myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@", argumentArray: [Org_id,0,"active"])
//        }else{
//            myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@ AND cust_name contains[c] %@", argumentArray: [Org_id,0,"active",searchText])
//        }
//
//        objRequest.predicate = myPredicate
//
//        // CHANGED HERE DEV1
//        if sortedData == true {
//            let sortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
//            let sortDescriptors = [sortDescriptor2]
//            objRequest.sortDescriptors = sortDescriptors
//        }
//
//        do {
//            fetchedResults = try context.fetch(objRequest) as? [En_Route] ?? []
//            for i in 0..<min(WebAccess.paginingSize,fetchedResults.count){
//                data.append(fetchedResults[i])
//            }
//            return data
//        } catch let error as NSError {
//            print("\(error.localizedDescription.description)")
//        }
//
//        return nil
    }
    
    //MARK:- UPDATE Route STATUS
    @nonobjc public class func UpdateRouteStatus(_ rId:Int64,_ statusId:Int?, _ statusName:String?) {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate = NSPredicate(format: "route_id == \(rId)")
        fetchRequest.predicate = predicate
        do {
            let items = try context.fetch(fetchRequest)
            if items.count != 0{
                let route = items[0] as! En_Route
//                if let id = statusId{
//                    route.route_status = Int64(id)
//                }
                if let name = statusName {
                    route.route_status = name
                    route.status_name = name
                }
                do {
                    try myContext.save()
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }
            }
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
    }

    
    // Deletes a Route
    @nonobjc public class func delete_RouteWithId(id: NSManagedObjectID){
        if let DataToDelete = getById(id: id){
            self.myContext.delete(DataToDelete)
        }
    }
    
    //MARK:- DELETE DATA
    @nonobjc public class func deleteDataWithId(id:Int64) {
        
        let fetchRequest = NSFetchRequest<En_Route>(entityName: "En_Route")
        
        let myPredicate = NSPredicate(format: "route_id == \(id)")
       // fetchRequest.predicate = myPredicate
        do {
            let items = try myContext.fetch(fetchRequest)
            for obj in items{
                myContext.delete(obj)
            }
            try myContext.save()
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
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
    }
    
}

