//
//  En_Customer+CoreDataClass.swift
//  OrangeWill
//
//  Created by Hupp Technologies on 08/07/17.
//  Copyright © 2017 Hupp Technologies. All rights reserved.
//

import Foundation
import CoreData

@objc(En_Customer)

public class En_Customer: NSManagedObject {
    
    static let myContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    static let myEntity = NSEntityDescription.entity(forEntityName: "En_Customer", in:myContext)!
    
    static var autoIncreament:Int64 = 0
    
    //MARK: INSERT CUSTOMER
    @nonobjc public class func insertCustomerData(dataDict: NSDictionary) {
        
        var infoDict = NSDictionary()
        infoDict = dataDict
        
        let tmpEntity =  En_Customer(entity: myEntity, insertInto: myContext)
        
        tmpEntity.user_id = Int64(getIntegerFromAny(infoDict.value(forKey: "user_id") ?? 0))
        tmpEntity.org_id = getInt64FromAny(infoDict.value(forKey: "org_id") ?? 0)
        tmpEntity.route_id = Int64(getIntegerFromAny(infoDict.value(forKey: "route_id") ?? 0))
        tmpEntity.route_name = infoDict.value(forKey: "route_name") as? String ?? ""
        tmpEntity.cust_type_id = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_type_id") ?? 0))
        tmpEntity.cust_type_name = infoDict.value(forKey: "cust_type_name") as? String ?? ""
        if let cust_id = infoDict.value(forKey: "cust_id") {
            tmpEntity.cust_id = getInt64FromAny(cust_id)
        }
        tmpEntity.add_by = Int64(getIntegerFromAny(infoDict.value(forKey: "add_by") ?? 0))
        
        
        tmpEntity.cust_status = infoDict.value(forKey: "cust_status") as? String ?? ""
        tmpEntity.hidden = Int64(getIntegerFromAny(infoDict.value(forKey: "hidden") ?? 0))
        tmpEntity.cust_special_disc_applicable = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_special_disc_applicable") ?? 0))
        tmpEntity.cust_cont_number = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_cont_number") ?? 0))
        
        tmpEntity.status_name = infoDict.value(forKey: "status_name") as? String ?? ""
        tmpEntity.add_dt = infoDict.value(forKey: "add_dt") as? String ?? ""
        tmpEntity.user_fname = infoDict.value(forKey: "user_fname") as? String ?? ""
        
        tmpEntity.cust_name = infoDict.value(forKey: "cust_name") as? String ?? ""
        tmpEntity.cust_latitude = infoDict.value(forKey: "cust_latitude") as? String ?? ""
        tmpEntity.cust_longitude = infoDict.value(forKey: "cust_longitude") as? String ?? ""
        tmpEntity.cust_alt_cont_name = infoDict.value(forKey: "cust_alt_cont_name") as? String ?? ""
        tmpEntity.cust_alt_cont_number = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_alt_cont_number") ?? 0))
        tmpEntity.cust_alt_cont_email = infoDict.value(forKey: "cust_alt_cont_email") as? String ?? ""
        tmpEntity.cust_pincode_address = infoDict.value(forKey: "cust_pincode_address") as? String ?? ""
        tmpEntity.cust_tin_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_tin_no") ?? 0))
        tmpEntity.cust_estab_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_estab_no") ?? 0))
        tmpEntity.cust_vat_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_vat_no") ?? 0))
        tmpEntity.cust_special_disc_per = infoDict.value(forKey: "cust_special_disc_per") as? Double ?? 0
        
        tmpEntity.cust_drug_lic_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_drug_lic_no") ?? 0))
        tmpEntity.cust_cont_name = infoDict.value(forKey: "cust_cont_name") as? String ?? ""
        tmpEntity.cust_cont_email = infoDict.value(forKey: "cust_cont_email") as? String ?? ""
        tmpEntity.cust_full_address = infoDict.value(forKey: "cust_full_address") as? String ?? ""
        tmpEntity.first_letter =  infoDict.value(forKey: "first_letter") as? String ?? ""
        tmpEntity.status_name = infoDict.value(forKey: "status_name") as? String ?? ""
        tmpEntity.cust_normal_address = infoDict.value(forKey: "cust_normal_address") as? String ?? ""
        tmpEntity.cust_land_address = infoDict.value(forKey: "cust_land_address") as? String ?? ""
        tmpEntity.cust_state_address = infoDict.value(forKey: "cust_state_address") as? String ?? ""
        tmpEntity.cust_city_address = infoDict.value(forKey: "cust_city_address") as? String ?? ""
        tmpEntity.cust_user_name = infoDict.value(forKey: "cust_user_name") as? String ?? ""
        tmpEntity.cust_user_number = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_user_number") ?? 0))
        tmpEntity.cust_user_email = infoDict.value(forKey: "cust_user_email") as? String ?? ""
        tmpEntity.timing_to = infoDict.value(forKey: "timing_to") as? String ?? ""
        tmpEntity.timing_from = infoDict.value(forKey: "timing_from") as? String ?? ""
        tmpEntity.isSync = infoDict.value(forKey: "isSync") as? Bool ?? true
        tmpEntity.cust_remarks = infoDict.value(forKey: "cust_remarks") as? String ?? ""
        tmpEntity.offline_operation_type = infoDict.value(forKey: "offline_operation_type") as? String ?? ""
        tmpEntity.offline_time_stamp = infoDict.value(forKey: "offline_time_stamp") as? String ?? ""
        
        if let sup_assign_ids = infoDict.value(forKey: "sup_assign_id") as? [Int] {
            tmpEntity.sup_assign_id = sup_assign_ids
        }
        
        if let salesmanList = infoDict.value(forKey: "assignsalesmanlst") as? [Dictionary<String, Any>] {
            tmpEntity.assignsalesmanlst = salesmanList
        }
        if let defSalesmanList = infoDict.value(forKey: "defsalesmanroutelst") as? [Dictionary<String, Any>] {
            tmpEntity.defsalesmanroutelst = defSalesmanList
        }
        if let value = infoDict.value(forKey: "cust_user_type_user_applicable") as? Int {
            if value > 0 {
                tmpEntity.cust_user_type_user_applicable = true
            }else {
                tmpEntity.cust_user_type_user_applicable = false
            }
        }
        if let lastSup = infoDict.value(forKey: "last_ord_sup_assign_details") as? [Dictionary<String, Any>] {
            tmpEntity.last_ord_sup_assign_details = lastSup
        }
        if let assign_salesman = infoDict.value(forKey: "assign_salesman") as? [Dictionary<String, Any>] {
            tmpEntity.assign_salesman = assign_salesman
        }
        if let cust_img = infoDict.value(forKey: "cust_pic_lst") as? NSArray {
            tmpEntity.cust_pic_lst = cust_img
        }
        tmpEntity.visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "visit_count") ?? 0))
        tmpEntity.total_price = getDoubleFromAny(infoDict.value(forKey: "total_price") ?? 0)
        tmpEntity.order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "order_count") ?? 0))
        
        tmpEntity.daily_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_visit_count") ?? 0))
        tmpEntity.daily_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "daily_order_count") ?? 0))
        tmpEntity.daily_total_price = getDoubleFromAny(infoDict.value(forKey: "daily_total_price") ?? 0)
        
        tmpEntity.weekly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_visit_count") ?? 0))
        tmpEntity.weekly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "weekly_order_count") ?? 0))
        tmpEntity.weekly_total_price = getDoubleFromAny(infoDict.value(forKey: "weekly_total_price") ?? 0)
        
        tmpEntity.monthly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_visit_count") ?? 0))
        tmpEntity.monthly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "monthly_order_count") ?? 0))
        tmpEntity.monthly_total_price = getDoubleFromAny(infoDict.value(forKey: "monthly_total_price") ?? 0)
        
        tmpEntity.yearly_visit_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_visit_count") ?? 0))
        tmpEntity.yearly_order_count = Int64(getIntegerFromAny(infoDict.value(forKey: "yearly_order_count") ?? 0))
        tmpEntity.yearly_total_price = getDoubleFromAny(infoDict.value(forKey: "yearly_total_price") ?? 0)
        
        
        if let _supplier = infoDict.value(forKey: "supplst") as? NSArray {
            tmpEntity.supplst = _supplier
        }
        
        tmpEntity.sort_key = "\(Int(Date().timeIntervalSince1970))"
        
        do {
            try myContext.save()
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
    }
    
    
    //MARK:- UPDATE CUSTOMER
    @nonobjc public class func getCustById(id: NSManagedObjectID) -> En_Customer? {
        return myContext.object(with: id) as? En_Customer
    }
    @nonobjc public class func updateCustomerRouteName(routeId:Int64,routeName:String)->Bool{
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate1 = NSPredicate(format: "route_id == \(routeId)")
        fetchRequest.predicate = predicate1
        
        do {
            let items = try context.fetch(fetchRequest)
            if items.count == 0{
                return false
            }else{
                for i in 0..<items.count{
                    let tmpEntity:En_Customer  =  items[i] as! En_Customer
                    tmpEntity.route_name = routeName as String
                }
                try myContext.save()
            }
            return true//(items.last as! En_Customer)
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            return false
        }
        
        
    }
    
    @nonobjc public class func updateCustomerRecord(objId:NSManagedObjectID,infoDict:NSDictionary){
        
        guard let tmpEntity = self.getCustById(id: objId) else {
            print("=====================Customer Not Found while updating========")
            return
        }
//        cust_pic_lst
       

        if let userid = infoDict.value(forKey: "user_id") {
            tmpEntity.user_id = getInt64FromAny(userid)
        }
        if let orgId = infoDict.value(forKey: "org_id") {
            tmpEntity.org_id = getInt64FromAny(orgId)
        }
        if let route = infoDict.value(forKey: "route_id") {
            tmpEntity.route_id = getInt64FromAny(route)
        }
        if let routeName =  infoDict.value(forKey: "route_name") as? String {
            tmpEntity.route_name = routeName
        }
        if let custTypeId = infoDict.value(forKey: "cust_type_id") {
            tmpEntity.cust_type_id = getInt64FromAny(custTypeId)
        }
        if let custTypeName = infoDict.value(forKey: "cust_type_name") as? String {
            tmpEntity.cust_type_name = custTypeName
        }
        if let cust_id = infoDict.value(forKey: "cust_id") {
            tmpEntity.cust_id = getInt64FromAny(cust_id)
        }
        if let addBy = infoDict.value(forKey: "add_by") {
            tmpEntity.add_by = getInt64FromAny(addBy)
        }
        if let custStatus = infoDict.value(forKey: "cust_status") {
            tmpEntity.cust_status = custStatus as? String ?? ""
        }
        if let hidden = infoDict.value(forKey: "hidden") {
            tmpEntity.hidden = getInt64FromAny(hidden)
        }
        if let discountAplic = infoDict.value(forKey: "cust_special_disc_applicable") {
            tmpEntity.cust_special_disc_applicable = getInt64FromAny(discountAplic)
        }
        if let contNumber = infoDict.value(forKey: "cust_cont_number") {
            tmpEntity.cust_cont_number = getInt64FromAny(contNumber)
        }
        if let addDate =  infoDict.value(forKey: "add_dt") as? String {
            tmpEntity.add_dt = addDate
        }
        if let username = infoDict.value(forKey: "user_fname") as? String {
            tmpEntity.user_fname = username
        }
        if let status_name = infoDict.value(forKey: "status_name") as? String {
            tmpEntity.status_name = status_name
        }
        //         tmpEntity.status_name = infoDict.value(forKey: "status_name") as? String ?? ""
        
        tmpEntity.cust_name = infoDict.value(forKey: "cust_name") as? String ?? ""
        tmpEntity.cust_latitude = infoDict.value(forKey: "cust_latitude") as? String ?? ""
        tmpEntity.cust_longitude = infoDict.value(forKey: "cust_longitude") as? String ?? ""
        tmpEntity.cust_alt_cont_name = infoDict.value(forKey: "cust_alt_cont_name") as? String ?? ""
        tmpEntity.cust_alt_cont_number = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_alt_cont_number") ?? 0))
        tmpEntity.cust_alt_cont_email = infoDict.value(forKey: "cust_alt_cont_email") as? String ?? ""
        tmpEntity.cust_pincode_address = infoDict.value(forKey: "cust_pincode_address") as? String ?? ""
        tmpEntity.cust_tin_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_tin_no") ?? 0))
        tmpEntity.cust_estab_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_estab_no") ?? 0))
        tmpEntity.cust_vat_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_vat_no") ?? 0))
        tmpEntity.cust_special_disc_per = infoDict.value(forKey: "cust_special_disc_per") as? Double ?? 0
        
        tmpEntity.cust_drug_lic_no = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_drug_lic_no") ?? 0))
        tmpEntity.cust_cont_name = infoDict.value(forKey: "cust_cont_name") as? String ?? ""
        tmpEntity.cust_cont_email = infoDict.value(forKey: "cust_cont_email") as? String ?? ""
        tmpEntity.cust_full_address = infoDict.value(forKey: "cust_full_address") as? String ?? ""
        tmpEntity.first_letter =  infoDict.value(forKey: "first_letter") as? String ?? ""
        tmpEntity.status_name = infoDict.value(forKey: "status_name") as? String ?? ""
        tmpEntity.cust_normal_address = infoDict.value(forKey: "cust_normal_address") as? String ?? ""
        tmpEntity.cust_land_address = infoDict.value(forKey: "cust_land_address") as? String ?? ""
        tmpEntity.cust_state_address = infoDict.value(forKey: "cust_state_address") as? String ?? ""
        tmpEntity.cust_city_address = infoDict.value(forKey: "cust_city_address") as? String ?? ""
        tmpEntity.cust_user_name = infoDict.value(forKey: "cust_user_name") as? String ?? ""
        tmpEntity.cust_user_number = Int64(getIntegerFromAny(infoDict.value(forKey: "cust_user_number") ?? 0))
        tmpEntity.cust_user_email = infoDict.value(forKey: "cust_user_email") as? String ?? ""
        tmpEntity.timing_to = infoDict.value(forKey: "timing_to") as? String ?? ""
        tmpEntity.timing_from = infoDict.value(forKey: "timing_from") as? String ?? ""
        tmpEntity.cust_remarks = infoDict.value(forKey: "cust_remarks") as? String ?? ""
        
        if let sync = infoDict.value(forKey: "isSync") as? Bool {
            tmpEntity.isSync = sync
        }
        if let offlineOpType = infoDict.value(forKey: "offline_operation_type") as? String {
            tmpEntity.offline_operation_type = offlineOpType
        }
        if let offlinetime =  infoDict.value(forKey: "offline_time_stamp") as? String {
            tmpEntity.offline_time_stamp = offlinetime
        }
        
        if let sup_assign_ids = infoDict.value(forKey: "sup_assign_id") as? [Int] {
            tmpEntity.sup_assign_id = sup_assign_ids
            
        }
        if let salesmanList = infoDict.value(forKey: "assignsalesmanlst") as? [Dictionary<String, Any>] {
            tmpEntity.assignsalesmanlst = salesmanList
        }
        if let defSalesmanList = infoDict.value(forKey: "defsalesmanroutelst") as? [Dictionary<String, Any>] {
            tmpEntity.defsalesmanroutelst = defSalesmanList
        }
        
        if let value = infoDict.value(forKey: "cust_user_type_user_applicable") as? Int {
            if value > 0 {
                tmpEntity.cust_user_type_user_applicable = true
            }else {
                tmpEntity.cust_user_type_user_applicable = false
            }
        }
        if let lastSup = infoDict.value(forKey: "last_ord_sup_assign_details") as? [Dictionary<String, Any>] {
            tmpEntity.last_ord_sup_assign_details = lastSup
        }
        if let assign_salesman = infoDict.value(forKey: "assign_salesman") as? [Dictionary<String, Any>] {
            tmpEntity.assign_salesman = assign_salesman
        }
        if let cust_img = infoDict.value(forKey: "cust_pic_lst") as? NSArray {
            tmpEntity.cust_pic_lst = cust_img
        }
        if let cust_pic_lst = infoDict.value(forKey: "cust_pic_lst") as? NSArray{
            tmpEntity.cust_pic_lst = cust_pic_lst
        }
        if let visit_count = infoDict.value(forKey: "visit_count") , let total_price = infoDict.value(forKey: "total_price") ,
            let order_count = infoDict.value(forKey: "total_order_count") {
            
            tmpEntity.visit_count = getInt64FromAny(visit_count)
            tmpEntity.total_price = getDoubleFromAny(total_price)
            tmpEntity.order_count = getInt64FromAny(order_count)
            
        }
        if let daily_visit_count = infoDict.value(forKey: "daily_visit_count") ,
            let daily_order_count = infoDict.value(forKey: "daily_order_count") ,
            let daily_total_price = infoDict.value(forKey: "daily_total_price") {
            
            tmpEntity.daily_visit_count = getInt64FromAny(daily_visit_count)
            tmpEntity.daily_order_count = getInt64FromAny(daily_order_count)
            tmpEntity.daily_total_price = getDoubleFromAny(daily_total_price)
        }
        
        if let weekly_visit_count = infoDict.value(forKey: "weekly_visit_count") ,
            let weekly_order_count = infoDict.value(forKey: "weekly_order_count") ,
            let weekly_total_price = infoDict.value(forKey: "weekly_total_price") {
            
            tmpEntity.weekly_visit_count = getInt64FromAny(weekly_visit_count)
            tmpEntity.weekly_order_count = getInt64FromAny(weekly_order_count)
            tmpEntity.weekly_total_price = getDoubleFromAny(weekly_total_price)
        }
        if let monthly_visit_count = infoDict.value(forKey: "monthly_visit_count") ,
            let monthly_order_count = infoDict.value(forKey: "monthly_order_count") ,
            let monthly_total_price = infoDict.value(forKey: "monthly_total_price") {
            
            tmpEntity.monthly_visit_count = getInt64FromAny(monthly_visit_count)
            tmpEntity.monthly_order_count = getInt64FromAny(monthly_order_count)
            tmpEntity.monthly_total_price = getDoubleFromAny(monthly_total_price)
        }
        
        if let yearly_visit_count = infoDict.value(forKey: "yearly_visit_count") ,
            let yearly_order_count = infoDict.value(forKey: "yearly_order_count") ,
            let yearly_total_price = infoDict.value(forKey: "yearly_total_price") {
            
            tmpEntity.yearly_visit_count = getInt64FromAny(yearly_visit_count)
            tmpEntity.yearly_order_count = getInt64FromAny(yearly_order_count)
            tmpEntity.yearly_total_price = getDoubleFromAny(yearly_total_price)
        }
        
        //tmpEntity.supplst = infoDict.value(forKey: "supplst") as? NSArray ?? NSArray()
        if let _supplier = infoDict.value(forKey: "supplst") as? NSArray {
            tmpEntity.supplst = _supplier
        }
        
        do {
            try myContext.save()
        } catch {
            print("=========================ERROR WHILE UPDATING CUSTOMER===============")
        }
        
    }
    @nonobjc public class func Update_Data(cId:Int64,infoDict:NSDictionary) ->Bool {
        
        let fetchRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        let predicate = NSPredicate(format: "cust_id == \(cId)")
        fetchRequest.predicate = predicate
        
        do {
            let items = try myContext.fetch(fetchRequest)
            if items.count == 0{
                return false
            }else{
                guard let tmpEntity = items.first else {return false}
                self.updateCustomerRecord(objId: tmpEntity.objectID, infoDict: infoDict)
                return true
            }
            
        }catch {}
        
        return false
    }
    // MARK: FETCH ACTIVE LIST COUNT
    @nonobjc public class func Cust_ActiveListSearchCount(Org_id:Int,searchText:String) -> Int {
        
       // var fetchedResults = [En_Customer]()
        
        let context:NSManagedObjectContext = myContext
        
        let objRequest = NSFetchRequest<NSFetchRequestResult>()
        objRequest.entity = myEntity
        
        objRequest.returnsObjectsAsFaults = false
        
        var myPredicate = NSPredicate.init()
        if searchText.isEmpty{
         myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@ ", argumentArray: [Org_id,0,"active"])
        }else{
             myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@ AND cust_name contains[c] %@", argumentArray: [Org_id,0,"active",searchText])
        }
        objRequest.predicate = myPredicate
        do {
            return try context.count(for: objRequest)  ?? 0
        } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        return 0
    }
    //MARK:- FETCH CUSTOMER active list WITH PAGING WITH SEARCH TEXT
    @nonobjc public class func Cust_ActiveListWithSearchTextOffset(Org_id:Int,sortedData:Bool,lastIndex:Int,searchText:String) -> [En_Customer]? {
        
        var fetchedResults = [En_Customer]()
        var data = [En_Customer]()
        let context:NSManagedObjectContext = myContext
        
        let objRequest = NSFetchRequest<NSFetchRequestResult>()
        objRequest.entity = myEntity
        objRequest.fetchLimit = WebAccess.paginingSize
        objRequest.fetchOffset = lastIndex
        objRequest.returnsObjectsAsFaults = false

        var myPredicate = NSPredicate.init()
        
        if searchText.isEmpty{
               myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@", argumentArray: [Org_id,0,"active"])
        }else{
             myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@ AND cust_name contains[c] %@", argumentArray: [Org_id,0,"active",searchText])
        }
        
        objRequest.predicate = myPredicate
        
        // CHANGED HERE DEV1
        if sortedData == true {
            let sortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
            let sortDescriptors = [sortDescriptor2]
            objRequest.sortDescriptors = sortDescriptors
        }
        
        do {
            fetchedResults = try context.fetch(objRequest) as? [En_Customer] ?? []
            for i in 0..<min(WebAccess.paginingSize,fetchedResults.count){
                data.append(fetchedResults[i])
            }
            return data
        } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        
        return nil
    }
    
    //MARK:- FETCH CUSTOMER active list WITH PAGING
    @nonobjc public class func Cust_ActiveList(Org_id:Int,sortedData:Bool) -> [En_Customer]? {
        
            var fetchedResults = [En_Customer]()
        
            let context:NSManagedObjectContext = myContext
            
            let objRequest = NSFetchRequest<NSFetchRequestResult>()
            objRequest.entity = myEntity
        
            objRequest.returnsObjectsAsFaults = false
            
            let myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@", argumentArray: [Org_id,0,"active"])
            
            objRequest.predicate = myPredicate
            
            // CHANGED HERE DEV1
            if sortedData == true {
                let sortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
                let sortDescriptors = [sortDescriptor2]
                objRequest.sortDescriptors = sortDescriptors
            }
            
            
            do {
                fetchedResults = try context.fetch(objRequest) as? [En_Customer] ?? []
                return fetchedResults
            } catch let error as NSError {
                // something went wrong, print the error.
                print("\(error.localizedDescription.description)")
            }
        return nil
    }
    
    //MARK:- FETCH CUSTOMER INACTIVE LIST
    @nonobjc public class func Cust_InactiveList(Org_id:Int,sortedData:Bool) -> [En_Customer]? {
        
        let context:NSManagedObjectContext = myContext
        var data = [En_Customer]()
        var fetchedResults = [En_Customer]()

            let objRequest = NSFetchRequest<NSFetchRequestResult>()
            objRequest.entity = myEntity
            objRequest.returnsObjectsAsFaults = false
            
            let myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@ AND status_name == %@", argumentArray: [Org_id,0,"inactive"])
            objRequest.predicate = myPredicate

            if sortedData == true {
                let sortDescriptor1 = NSSortDescriptor(key: "add_dt", ascending: false)
                let sortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
                
                let sortDescriptors = [sortDescriptor1,sortDescriptor2]
                objRequest.sortDescriptors = sortDescriptors
            }
            
            
            do {
                fetchedResults = try context.fetch(objRequest) as? [En_Customer] ?? []

                return fetchedResults as? [En_Customer]
            } catch let error as NSError {
                // something went wrong, print the error.
                print("\(error.localizedDescription.description)")
            }
            
        
        return nil
        
    }
    
    //MARK:- FETCH CUSTOMER INACTIVE LIST
    @nonobjc public class func Cust_HiddenList(Org_id:Int,sortedData:Bool) -> [En_Customer]? {
        
        let context:NSManagedObjectContext = myContext
        
        let objRequest = NSFetchRequest<NSFetchRequestResult>()
        objRequest.entity = myEntity
        
        //let objRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        objRequest.returnsObjectsAsFaults = false
        
        let myPredicate = NSPredicate(format: "org_id == %@ AND hidden == %@", argumentArray: [Org_id,1])
        objRequest.predicate = myPredicate
        
        if sortedData == true {
            let sortDescriptor1 = NSSortDescriptor(key: "add_dt", ascending: false)
            let sortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
            let sortDescriptors = [sortDescriptor1,sortDescriptor2]
            objRequest.sortDescriptors = sortDescriptors
        }
        
        
        do {
            let fetchedResults = try context.fetch(objRequest)
            return fetchedResults as? [En_Customer]
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        return nil
    }
    
    //MARK:- FETCH CUSTOMER
    @nonobjc public class func fetchCustomerWithOrdId(_ ordid:Int64 ,_ status:String, routeId:Int64?,_ isHidden:Int64?) -> [En_Customer] {
        //    @nonobjc public class func fetchCustomerWithOrdId(_ ordid:Int64 ,_ status:Int64, routeId:Int64?,_ isHidden:Int64?) -> [En_Customer] {
        let fetchRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        if routeId != nil {
            let predicate1 = NSPredicate(format: "org_id == \(ordid)")
            let predicate2 = NSPredicate(format: "route_id == \(routeId ?? -1 )")
            let predicate3 = NSPredicate(format: "cust_status == %@",status)
            _ = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2,predicate3])
            let myPredicate = NSPredicate(format: "org_id == %@ AND route_id == %@ AND cust_status == %@", argumentArray: [ordid,routeId ?? 0,status])
            fetchRequest.predicate = myPredicate
        }
        else if isHidden != nil{
            let predicate1 = NSPredicate(format: "org_id == \(ordid)")
            let predicate2 = NSPredicate(format: "hidden == \(isHidden ?? -1)")
            let predicate3 = NSPredicate(format: "cust_status == %@",status)
            let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2,predicate3])
            fetchRequest.predicate = predicateCompound
        }
        else{
            let predicate1 = NSPredicate(format: "org_id == \(ordid)")
            let predicate3 = NSPredicate(format: "cust_status == %@",status)
            let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate3])
            fetchRequest.predicate = predicateCompound
        }
        
        let sectionSortDescriptor1 = NSSortDescriptor(key: "sort_key", ascending: false)
        let sectionSortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
        let sortDescriptors = [sectionSortDescriptor1,sectionSortDescriptor2]
        fetchRequest.sortDescriptors = sortDescriptors
        
        //        let sortDescriptor = NSSortDescriptor(key: "sort_key", ascending: false)
        //        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        return []
    }
    
    //MARK:- FETCH CUSTOMER of routes
    @nonobjc public class func fetch_Route_Cust(org:Int64 , routeId:Int64) -> [En_Customer]? {
        
        let fetchRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        
        let predicate2 = NSPredicate(format: "route_id == \(routeId)")
        let predicate3 = NSPredicate(format: "cust_status == %@",WebAccess.statusNameActive)
        let predicate4 = NSPredicate(format: "hidden == \(0)")
        
        let myPredicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicate2,predicate3,predicate4])
        
        let sectionSortDescriptor1 = NSSortDescriptor(key: "sort_key", ascending: false)
        let sectionSortDescriptor2 = NSSortDescriptor(key: "cust_id", ascending: false)
        let sortDescriptors = [sectionSortDescriptor1,sectionSortDescriptor2]
        
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = myPredicate
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        return nil
    }
    
    //MARK:- FETCH ROUTE COUNT
    @nonobjc public class func fetchCustRouteCount(_ orgid:Int64?,_ routeId:Int64?) -> [En_Customer]? {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate1 = NSPredicate(format: "org_id == \(orgid ?? -1)")
        let predicate2 = NSPredicate(format: "route_id == \(routeId ?? -1)")
        let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        fetchRequest.predicate = predicateCompound
        
        do {
            let items = try context.fetch(fetchRequest)
            if items.count == 0{
                return nil
            }
            return items as? [En_Customer]
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    //MARK:- FETCH SINGLE CUSTOMER RECORED
    @nonobjc public class func fetchCustWithId(_ cId:Int64) -> En_Customer? {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate1 = NSPredicate(format: "cust_id == \(cId)")
        fetchRequest.predicate = predicate1
        
        do {
            let items = try context.fetch(fetchRequest)
            if items.count == 0{
                return nil
            }
            return (items.last as! En_Customer)
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    //MARK:- FETCH ALL CUSTOMER RESPECTIVE TO ORG_ID
    @nonobjc public class func fetchCustomerWithOrgId(_ orgid:Int64) -> [En_Customer] {
        
        let fetchRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        
        let predicate1 = NSPredicate(format: "org_id == \(orgid)")
        fetchRequest.predicate = predicate1
        
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
            
        } catch let error as NSError {
            print("\(error.localizedDescription.description)")
        }
        return []
    }
    
    //MARK:- GET UNASSING CUSTOMER LIST WITH ORG ID
    @nonobjc public class func fetchUnassignCustomerWithOrgId(_ orgid:Int64) -> [En_Customer] {
        
        let fetchRequest = NSFetchRequest<En_Customer>(entityName: "En_Customer")
        
        let predicate1 = NSPredicate(format: "org_id == \(orgid)")
        let predicate2 = NSPredicate(format: "route_id == \(0)")
        let predicateCompound = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        fetchRequest.predicate = predicateCompound
        
        let sortDescriptor = NSSortDescriptor(key: "cust_id", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let fetchedResults = try myContext.fetch(fetchRequest)
            return fetchedResults
            
        } catch let error as NSError {
            // something went wrong, print the error.
            print("\(error.localizedDescription.description)")
        }
        return []
    }
    
    
    //MARK:- UPDATE CUSTOMER STATUS
    @nonobjc public class func UpdateCustStatus(_ cId:Int64,_ statusId:Int?, _ statusName:String? , _ ishidden:Int?) {
        
        let context:NSManagedObjectContext = myContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = myEntity
        let predicate = NSPredicate(format: "cust_id == \(cId)")
        fetchRequest.predicate = predicate
        do {
            let items = try context.fetch(fetchRequest)
            if items.count != 0{
                let cust = items[0] as! En_Customer
                //                if let id = statusId{
                //                }
                if let name = statusName {
                    cust.cust_status = name
                    
                    cust.status_name = name
                }
                if let hide = ishidden {
                    cust.hidden = Int64(hide)
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
    
    // Gets a CUSTOMER by id
    @nonobjc public class func getById(id: NSManagedObjectID) -> En_Customer? {
        return self.myContext.object(with: id) as? En_Customer
    }
    
    //MARK:- DELETE CUSTOMER DATA
    
    // Deletes a person
    @nonobjc public class func deleteCustWithId(id: NSManagedObjectID){
        if let DataToDelete = getById(id: id){
            self.myContext.delete(DataToDelete)
        }
    }
    
    //    @nonobjc public class func deleteDataWithId(id:Int64) {
    //
    //        //let fetchReq = NSFetchRequest<En_Customer>(entityName: "En_Customer")
    //
    //        let fetchReq = NSFetchRequest<NSFetchRequestResult>()
    //        fetchReq.entity = myEntity
    //        //let myPredicate = NSPredicate(format: "isSync == %@",NSNumber(value: true))
    //        let myPredicate = NSPredicate.init(format: "cust_id == %@", argumentArray: [id])
    //        fetchReq.predicate = myPredicate
    //        fetchReq.returnsObjectsAsFaults = false
    //
    //        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchReq)
    //
    //        do {
    //            try myContext.execute(deleteRequest)
    //            try myContext.save()
    //        }
    //        catch let error as NSError {
    //             print("Error while deleting customer records...... \(error), \(error.userInfo)")
    //        }
    //
    //
    //
    ////        do {
    ////            let items = try myContext.fetch(fetchReq)
    ////            for obj in items{
    ////                myContext.delete(obj)
    ////            }
    ////            try myContext.save()
    ////        }catch let error as NSError{
    ////            print("Could not fetch \(error), \(error.userInfo)")
    ////        }
    //    }
    
    
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

