struct Person {
    name: String;
    age: Int;
    alive: Bool;
}

contract SingleStructField {
    person: Person;

    init() {
        self.person = Person{
            name: "Alice",
            age: 30,
            alive: true,
        };
    }
}