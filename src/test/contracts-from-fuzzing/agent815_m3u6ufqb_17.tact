struct Person {
    name: String;
    age: Int;
    email: String?;
}

contract PersonStore {
    person: Person;

    init() {
        self.person = Person{
            name: "Bob",
            age: 30,
            email: null
        };
    }
}