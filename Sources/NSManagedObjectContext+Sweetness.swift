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

    /**
     Counts the elements in an entity.
     - parameter entityName: The name of the entity to be counted.
     - parameter predicate: The predicate to be used to filter out objects from the count.
     - returns: The amount of items in the provided entity.
     */
    public func countEntity(entityName: String, predicate: NSPredicate? = nil) -> Int {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = predicate
        var error: NSError?
        let count = self.countForFetchRequest(fetchRequest, error: &error)
        if let error = error {
            print("Count error: %@", error.description)
        }
        return count
    }

    /**
     Fetchs the elements in an entity.
     - parameter entityName: The name of the entity to be fetched.
     - parameter predicate: The predicate to be used to filter out fetched objects.
     - parameter sortDescriptors: The sortDescriptors to be used to sort out fetched objects.
     - returns: The objects fetched for the requested entity.
     */
    public func fetchEntity<T: NSManagedObject>(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) throws -> [T] {
        let request = NSFetchRequest(entityName: entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        let objects = try self.executeFetchRequest(request) as? [T] ?? [T]()
        return objects
    }
}
