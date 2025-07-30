struct Person {
    age: Int;
}

contract TestFieldAccess {
    receive() {
        let p: Person = Person { age: 30 };
        let n: Int = p.age + 10;
    }
}
