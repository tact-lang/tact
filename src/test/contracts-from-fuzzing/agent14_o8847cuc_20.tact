contract TestTernary {
    receive() {
        // Ternary operator ?: is right-associative
        // false ? 1 : true ? 2 : 3 should be parsed as false ? 1 : (true ? 2 : 3), which yields 2
        let x: Int = false ? 1 : true ? 2 : 3;
        require(x == 2, "Ternary operator associativity failed: expected 2");
    }
}
