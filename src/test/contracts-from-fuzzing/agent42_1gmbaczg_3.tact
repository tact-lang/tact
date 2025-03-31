struct Person {
    age: Int;
    name: String;
}

contract Test {
    person: Person = Person{ age: 30, name: "Alice" };

    receive() {}

    // Getter that returns a struct
    get fun getPerson(): Person {
        return self.person;
    }
}
