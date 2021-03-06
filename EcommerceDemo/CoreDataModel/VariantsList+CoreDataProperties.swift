//
//  VariantsList+CoreDataProperties.swift
//  EcommerceDemo
//
//  Created by Nitesh Meshram on 3/22/18.
//  Copyright © 2018 NItesh. All rights reserved.
//
//

import Foundation
import CoreData


extension VariantsList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VariantsList> {
        return NSFetchRequest<VariantsList>(entityName: "VariantsList")
    }

    @NSManaged public var variantColor: String?
    @NSManaged public var variantId: String?
    @NSManaged public var variantPrice: String?
    @NSManaged public var variantSize: String?
    @NSManaged public var productVariants: ProductList?

}
