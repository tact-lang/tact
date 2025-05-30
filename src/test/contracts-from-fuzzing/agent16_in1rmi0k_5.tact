contract TestUnary {
    receive() {
        // Test unary minus operator
        let a: Int = -(-1); // should be 1
        // Test unary plus operator on integer literal (exists as binary plus)
        let b: Int = +42;   // though it's parsed as binary plus, acceptable here
    }
}
