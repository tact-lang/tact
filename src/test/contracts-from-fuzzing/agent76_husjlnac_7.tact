struct Person {
    age: Int;
}

contract TestFieldAccess {
    receive() {
        let p: Person = Person { age: 25 };
        dump(p.age);
    }
}
