contract TestTernaryValid {
    receive() {
        // Valid ternary operator with alternative cases nested without extra parentheses
        // According to documentation, this should evaluate to 3
        let a: Int = false ? 1 : false ? 2 : 3;
    }
}