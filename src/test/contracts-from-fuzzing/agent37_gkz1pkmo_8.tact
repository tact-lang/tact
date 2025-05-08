struct Person {
    name: String;
    age: Int;
}

contract TestFieldAccess {
    receive() {
        let p: Person = Person { name: "Alice", age: 30 };
        let a: Int = p.age;
        let n: String = p.name;
    }
}
