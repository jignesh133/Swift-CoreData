//
//  En_Customer+CoreDataProperties.swift
//  OrangeWill
//
//  Created by Hupp Technologies on 25/01/18.
//  Copyright © 2018 Hupp Technologies. All rights reserved.
//
//

import Foundation
import CoreData


extension En_Customer {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<En_Customer> {
        return NSFetchRequest<En_Customer>(entityName: "En_Customer")
    }
    
    @NSManaged public var add_by: Int64
    @NSManaged public var add_dt: String?
    @NSManaged public var assignsalesmanlst: [Dictionary<String, Any>]
    @NSManaged public var comp_id: Int64
    @NSManaged public var cust_alt_cont_email: String?
    @NSManaged public var cust_alt_cont_name: String?
    @NSManaged public var cust_alt_cont_number: Int64
    @NSManaged public var cust_city_address: String?
    @NSManaged public var cust_cont_email: String?
    @NSManaged public var cust_cont_name: String?
    @NSManaged public var cust_cont_number: Int64
    @NSManaged public var cust_drug_lic_no: Int64
    @NSManaged public var cust_estab_no: Int64
    @NSManaged public var cust_full_address: String?
    @NSManaged public var cust_id: Int64
    @NSManaged public var cust_land_address: String?
    @NSManaged public var cust_latitude: String?
    @NSManaged public var cust_location: String?
    @NSManaged public var cust_longitude: String?
    @NSManaged public var cust_name: String?
    @NSManaged public var cust_normal_address: String?
    @NSManaged public var cust_pincode_address: String?
    @NSManaged public var cust_remarks: String?
    @NSManaged public var cust_special_disc_applicable: Int64
    @NSManaged public var cust_special_disc_per: Double
    @NSManaged public var cust_state_address: String?
    @NSManaged public var cust_status: String
    @NSManaged public var cust_tin_no: Int64
    @NSManaged public var cust_type_id: Int64
    @NSManaged public var cust_type_name: String?
    @NSManaged public var cust_user_email: String?
    @NSManaged public var cust_user_name: String?
    @NSManaged public var cust_user_number: Int64
    @NSManaged public var cust_user_type_user_applicable: Bool
    @NSManaged public var cust_vat_no: Int64
    @NSManaged public var daily_order_count: Int64
    @NSManaged public var daily_total_price: Double
    @NSManaged public var daily_visit_count: Int64
    @NSManaged public var defsalesmanroutelst: [Dictionary<String, Any>]
    @NSManaged public var first_letter: String?
    @NSManaged public var format: String?
    @NSManaged public var hidden: Int64
    @NSManaged public var isSync: Bool
    @NSManaged public var last_ord_sup_assign_details: [Dictionary<String, Any>]
    @NSManaged public var logged_in_userid: Int64
    @NSManaged public var monthly_order_count: Int64
    @NSManaged public var monthly_total_price: Double
    @NSManaged public var monthly_visit_count: Int64
    @NSManaged public var offline_operation_type: String?
    @NSManaged public var offline_time_stamp: String?
    @NSManaged public var order_count: Int64
    @NSManaged public var org_id: Int64
    @NSManaged public var route_id: Int64
    @NSManaged public var route_name: String?
    @NSManaged public var sort_key: String?
    @NSManaged public var status_name: String?
    @NSManaged public var sup_assign_id: [Int]
    @NSManaged public var supplst: NSArray?
    @NSManaged public var timing_from: String?
    @NSManaged public var timing_to: String?
    @NSManaged public var total_price: Double
    @NSManaged public var user_fname: String?
    @NSManaged public var user_id: Int64
    @NSManaged public var visit_count: Int64
    @NSManaged public var visit_time: [Dictionary<String, Any>]
    @NSManaged public var weekly_order_count: Int64
    @NSManaged public var weekly_total_price: Double
    @NSManaged public var weekly_visit_count: Int64
    @NSManaged public var yearly_order_count: Int64
    @NSManaged public var yearly_total_price: Double
    @NSManaged public var yearly_visit_count: Int64
    @NSManaged public var assign_salesman: [Dictionary<String, Any>]
    @NSManaged public var cust_pic_lst: NSArray?
   
    
}
