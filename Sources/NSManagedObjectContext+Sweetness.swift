import CoreData

extension NSManagedObjectContext {
    /**
     Drops the elements in an entity.
     - parameter entityName: The name of the entity to be dropped.
     - parameter predicate: The predicate to be used to filter out removed objects (optional).
     */
    public func dropEntity(_ entityName: String, predicate: Predicate? = nil) throws {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.predicate = predicate

        if #available(iOS 9.0, OSX 10.11, *) {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            try self.execute(batchDeleteRequest)
        } else {
            let objects = try self.fetch(request) as? [NSManagedObject] ?? [NSManagedObject]()
            for object in objects {
                self.delete(object)
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
    public func countEntity(_ entityName: String, predicate: Predicate? = nil) -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = predicate

        var count = 0
        do {
            count = try self.count(for: fetchRequest)
        } catch let error as NSError  {
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
    public func fetchEntity<T: NSManagedObject>(_ entityName: String, predicate: Predicate? = nil, sortDescriptors: [SortDescriptor]? = nil) throws -> [T] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        let objects = try self.fetch(request) as? [T] ?? [T]()
        return objects
    }
}
