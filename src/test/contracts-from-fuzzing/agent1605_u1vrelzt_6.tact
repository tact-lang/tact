struct Person {
    name: String;
    age: Int?;
    admin: Bool;
}

contract TestContract {
    owner: Person;

    init() {
        self.owner = Person{
            name: "Alice",
            age: null,
            admin: true
        };
    }

    receive() {
        self.owner = Person{
            name: "Bob",
            age: 33,
            admin: false
        };
    }
}