struct Person {
    name: String;
    nickname: String?;
    age: Int?;
}

contract OptionalStructFields {
    person: Person;

    init() {
        self.person = Person{
            name: "Test",
            age: null,
            nickname: null,
        };
    }
}