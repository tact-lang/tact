struct Person {
    age: Int
}

contract TestFieldAccess {
    receive() {
        let person: Person = Person { age: 30 };
        dump(person.age);
    }
}
