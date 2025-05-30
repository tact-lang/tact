struct Person {
    age: Int
}

contract TestFieldAccess {
    receive() {
        // Create a Person instance and test field access
        let p: Person = Person { age: 30 };
        let a: Int = p.age; // should be 30
    }
}
