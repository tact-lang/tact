struct Person {
    name: String;
    email: String?;
    age: Int;
    notes: String?;
}

contract OptionalFieldsContract {
    person: Person = Person{
        name: "Charlie",
        email: null,
        age: 25,
        notes: null,
    };

    init() {
        self.person = Person{
            name: "Dave",
            email: "dave@mail.com",
            age: 30,
            notes: "VIP",
        };
    }
}