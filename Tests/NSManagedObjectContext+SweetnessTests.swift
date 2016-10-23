import CoreData
import XCTest
import DATAStack

class NSManagedObjectContext_SweetnessTests: XCTestCase {
    func testDropEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(for: NSManagedObjectContext_SweetnessTests.self), storeType: .sqLite)
        try! stack.mainContext.dropEntity("User")
        try! stack.drop()
    }

    func testCountEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(for: NSManagedObjectContext_SweetnessTests.self), storeType: .sqLite)
        let count = try! stack.mainContext.countEntity("User")
        print(count)
        try! stack.drop()
    }

    func testFetchEntity() {
        let stack = DATAStack(modelName: "Tests", bundle: Bundle(for: NSManagedObjectContext_SweetnessTests.self), storeType: .sqLite)
        let users = try! stack.mainContext.fetchEntity("User")
        print(users)
        try! stack.drop()
    }
}
