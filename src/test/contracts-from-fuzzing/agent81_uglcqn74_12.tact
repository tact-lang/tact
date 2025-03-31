struct Person {
    name: String;
}

contract Test {
    // Test using string literal inside a struct initialization
    receive() {
         let p: Person = Person { name: "Alice" };
         // Accessing the string from struct
         let s: String = p.name;
    }
}
