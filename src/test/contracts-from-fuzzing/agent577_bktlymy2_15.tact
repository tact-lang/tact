struct Person {
    name: String;
    age: Int as uint8;
    active: Bool;
}

contract FieldOverwrite {
    person: Person;

    init() {
        self.person = Person{
            name: "Alex",
            age: 30,
            active: true
        };
        self.person = Person{
            name: "Bob",
            age: 40,
            active: false
        };
    }
}
