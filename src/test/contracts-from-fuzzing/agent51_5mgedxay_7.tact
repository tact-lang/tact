struct Person {
    name: String;
    age: Int;
}

contract FieldAccessTest {
    receive() {
        let p: Person = Person { name: "Alice", age: 30 };
        let n: String = p.name;
    }
}
