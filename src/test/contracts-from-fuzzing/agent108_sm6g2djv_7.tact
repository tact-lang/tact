struct Person {
    name: String;
}

contract TestContract {
    receive() {
        let p: Person = Person { name: "Alice" };
    }
}
