contract TestTernary {
    receive() {
        // Simple ternary operator
        let a: Int = true ? 1 : 2;            // expected: 1
        let b: Int = false ? 1 : 2;           // expected: 2
        
        // Nested ternary operator with right associativity in alternative part
        // In Tact, the following is parsed as: false ? 1 : (false ? 2 : 3)
        // expected: 3
        let c: Int = false ? 1 : false ? 2 : 3;
    }
}
