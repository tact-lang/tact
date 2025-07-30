struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct Person {
    name: String;
    age: Int?;
    location: NestedPoint;
}

contract StoreNestedStruct {
    data: Person;

    init() {
        self.data = Person{
            name: "Alice",
            age: 30,
            location: NestedPoint{ x: 10, y: 20 }
        };
    }
}
