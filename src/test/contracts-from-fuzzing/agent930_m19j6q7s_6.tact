struct Person {
    name: String;
    age: Int;
    email: String?;
    alive: Bool;
}

contract PeopleStorage {
    person1: Person;
    person2: Person;

    init() {
        self.person1 = Person{
            name: "Alice",
            age: 30,
            email: "alice@abc.com",
            alive: true
        };
        self.person2 = Person{
            name: "Bob",
            age: 25,
            email: null,
            alive: false
        };
    }
}