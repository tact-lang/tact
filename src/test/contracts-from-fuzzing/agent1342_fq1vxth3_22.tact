struct Person {
    name: String;
    age: Int;
    alive: Bool;
}

contract StorePerson {
    record: Person;

    init() {
        self.record = Person{
            name: "Alice",
            age: 30,
            alive: true
        };
    }
}