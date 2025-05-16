struct Person {
    name: String;
}

contract Test {
    receive() {
        // Correct instantiation of a struct with a String field
        let p: Person = Person { name: "Alice" };
        dump(p.name);
    }
}
