struct Person {
    name: String;
    age: Int?;
    isMember: Bool;
}

contract Test2 {
    member: Person;
    init() {
        self.member = Person{
            name: "Alice",
            age: null,
            isMember: true
        };
    }
}
