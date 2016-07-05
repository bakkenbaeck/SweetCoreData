import CoreData
import XCTest
import DATAStack

class NSManagedObjectContext_SweetnessTests: XCTestCase {
    func testDropEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(forClass: NSManagedObjectContext_SweetnessTests.self), storeType: .SQLite)
        try! stack.mainContext.dropEntity("User")
        stack.drop()
    }

    func testCountEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(forClass: NSManagedObjectContext_SweetnessTests.self), storeType: .SQLite)
        let count = stack.mainContext.countEntity("User")
        print(count)
        stack.drop()
    }

    func testFetchEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(forClass: NSManagedObjectContext_SweetnessTests.self), storeType: .SQLite)
        let users = try! stack.mainContext.fetchEntity("User")
        print(users)
        stack.drop()
    }
}
