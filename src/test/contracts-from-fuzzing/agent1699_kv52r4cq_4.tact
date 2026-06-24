struct Person {
    name: String;
    age: Int?;
    nickname: String?;
}

contract PeopleContract {
    member: Person;

    init() {
        self.member = Person{
            name: "Alice",
            age: null,
            nickname: "A",
        };
    }
}