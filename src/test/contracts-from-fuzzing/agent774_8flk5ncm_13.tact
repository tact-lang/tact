struct Person {
    name: String;
    age: Int;
    email: String?;
}

contract StorageWithPerson {
    p: Person;
    init() {
        self.p = Person{name: "john", age: 30, email: null};
    }
}