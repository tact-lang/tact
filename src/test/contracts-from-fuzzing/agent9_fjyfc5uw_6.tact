struct Person { age: Int }

contract TestFieldAccess {
    receive() {
        // Field access test: construct a Person instance and access its field
        let p: Person = Person { age: 30 };
        let a: Int = p.age;
        dump(a); // expected output: 30
    }
}
