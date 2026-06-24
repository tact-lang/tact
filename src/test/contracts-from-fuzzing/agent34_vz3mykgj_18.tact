contract TestTernaryNested {
    receive() {
        // Testing right-associativity of ternary operator alternatives
        let a: Int = false ? 1 : false ? 2 : 3; // expected: 3
        let b: Int = true ? 1 : false ? 2 : 3;  // expected: 1
        let c: String = false ? "a" : true ? "b" : "c"; // expected: "b"
    }
}
