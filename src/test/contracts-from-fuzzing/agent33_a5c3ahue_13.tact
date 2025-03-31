struct Person {
    name: String;
}

contract Test {
    receive() {
        // Testing struct instantiation and string literal field
        let p: Person = Person { name: "Alice" };
        dump(p.name);
    }
    
    fun dump(s: String) {
        // no-op dump function
    }
}
