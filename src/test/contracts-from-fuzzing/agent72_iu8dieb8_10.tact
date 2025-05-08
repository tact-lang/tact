struct Person { name: String; age: Int; }

contract TestFieldAccess {
    receive() {
        let p: Person = Person { name: "Alice", age: 42 };
        let n: String = p.name;
    }
}
