struct Person { name: String; age: Int }

contract TestFieldAccess {
    receive() {
        let p = Person { name: "Alice", age: 30 };
        dump(p.age);
    }
}
