struct Person {
    name: String;
    age: Int?;
    isMember: Bool?;
}

contract OptionalStructFields {
    member: Person;

    init() {
        self.member = Person{
            name: "Alice",
            age: null,
            isMember: null
        };
    }
}