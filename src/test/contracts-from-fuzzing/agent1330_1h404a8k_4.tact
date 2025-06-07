struct Person {
    name: String;
    age: Int;
}

contract People {
    person: Person;

    init() {
        self.person = Person{
            name: "Alice",
            age: 25,
        };
    }

    receive() {
        // dummy call to include contract
    }
}
