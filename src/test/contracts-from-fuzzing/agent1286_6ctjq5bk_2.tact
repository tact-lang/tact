struct Person {
    name: String;
    age: Int;
    nickname: String?;
    verified: Bool;
}

contract People {
    person: Person;

    init() {
        self.person = Person{
            name: "Alice",
            age: 30,
            nickname: null,
            verified: true,
        };
    }
}