struct Person {
    name: String;
}

contract TestContract {
    receive() {
        // Create an instance of Person with a string literal
        let p: Person = Person{
            name: "Alice",
        };
        dump(p.name);
    }
}
