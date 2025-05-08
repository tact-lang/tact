contract TestTernary {
    receive() {
        // Ternary expressions with different types
        let a: Int = true ? 10 : 20;              // expected: 10
        let b: Int = (false ? 10 : 20) + 5;         // expected: 25
        let c: String = false ? "foo" : "bar";   // expected: "bar"
    }
}
