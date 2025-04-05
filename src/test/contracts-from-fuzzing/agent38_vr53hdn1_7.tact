struct Person { age: Int }

contract TestFieldAccess {
    receive() {
        // Create a Person struct instance
        let p: Person = Person { age: 30 };
        // Access the field
        let a: Int = p.age;
        // Nested expression using field access
        let calc: Int = (p.age + 10) * 2;
    }
}
