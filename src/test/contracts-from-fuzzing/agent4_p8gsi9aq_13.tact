struct Person { age: Int; name: String }

contract TestDestructuringAssignment {
    receive() {
        // Destructuring assignment for the Person struct
        let Person { age, name } = Person { age: 30, name: "Alice" };
        // Use the destructured variables
        let a: Int = age;       // expected: 30
        let n: String = name;   // expected: "Alice"
    }
}
