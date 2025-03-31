struct Person {
    name: String;
}

contract TestStructString {
    receive() {
        // Correct instantiation of a struct using curly braces as per Tact syntax
        let p: Person = Person{ name: "Alice" };
        dump(p.name);
    }
}
