struct Person {
    name: String;
    age: Int as uint8;
}

contract NestedStruct {
    person: Person;

    init() {
        self.person = Person{ name: "Alice", age: 30 };
    }
}