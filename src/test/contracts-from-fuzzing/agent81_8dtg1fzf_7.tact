struct Person {
    name: String;
}

contract TestFieldAccess {
    receive() {
        let p: Person = Person { name: "Alice" };
        dump(p.name);
    }
}
