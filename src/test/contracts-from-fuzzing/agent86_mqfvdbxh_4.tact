struct Person {
    age: Int;
    name: String;
}

contract Test {
    // Instantiate a struct using the correct syntax
    p: Person = Person { age: 30, name: "Alice" };

    // Getter returning a struct
    get fun getPerson(): Person {
        return self.p;
    }

    receive() {}
}
