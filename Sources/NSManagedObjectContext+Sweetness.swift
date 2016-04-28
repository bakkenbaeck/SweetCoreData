import CoreData

extension NSManagedObjectContext {
    /**
     Drops the elements in an entity.
     - parameter entityName: The name of the entity to be dropped.
     - parameter predicate: The predicate to be used to filter out removed objects (optional).
     */
    public func dropEntity(entityName: String, predicate: NSPredicate? = nil) throws {
        let request = NSFetchRequest(entityName: entityName)
        request.predicate = predicate

        if #available(iOS 9.0, OSX 10.11, *) {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            try self.executeRequest(batchDeleteRequest)
        } else {
            let objects = try self.executeFetchRequest(request) as? [NSManagedObject] ?? [NSManagedObject]()
            for object in objects {
                self.deleteObject(object)
            }
            if self.hasChanges {
                try self.save()
            }
        }
    }
}