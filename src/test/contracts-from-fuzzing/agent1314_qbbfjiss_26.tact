struct Person {
    name: String;
    age: Int;
    active: Bool;
}

contract PersonDefaults {
    p: Person;

    init() {
        self.p = Person{
            name: "Bob",
            age: 40,
            active: true,
        };
    }
}