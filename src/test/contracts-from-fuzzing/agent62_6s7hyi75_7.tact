struct Person { age: Int }

contract TestFieldAccess {
    receive() {
        // Testing field access on a struct
        let p: Person = Person { age: 30 };
        let a: Int = p.age;
    }
}
