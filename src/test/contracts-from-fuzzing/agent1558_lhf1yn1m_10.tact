struct Person {
    name: String;
    age: Int;
    alive: Bool;
    nickname: String?;
}

contract PeopleContract {
    alice: Person;
    bob: Person;
    charlie: Person;

    init() {
        self.alice = Person{
            name: "Alice",
            age: 30,
            alive: true,
            nickname: null
        };
        self.bob = Person{
            name: "Bob",
            age: 40,
            alive: true,
            nickname: null
        };
        self.charlie = Person{
            name: "Charlie",
            age: 50,
            alive: false,
            nickname: null
        };
    }
}
