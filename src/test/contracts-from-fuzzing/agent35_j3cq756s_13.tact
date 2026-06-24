struct Person {
    name: String;
    age: Int;
}

contract DestructuringTest {
    receive() {
        // Destructuring assignment and field access
        let Person { name, age } = Person { name: "Alice", age: 30 };
        let doubledAge = age * 2;
    }
}
