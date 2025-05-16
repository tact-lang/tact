struct Person {
    name: String;
    age: Int?;
    note: String?;
}

contract ComplexOption {
    person: Person;
    init() {
        self.person = Person{ name: "John", age: null, note: "Hello" };
    }
}