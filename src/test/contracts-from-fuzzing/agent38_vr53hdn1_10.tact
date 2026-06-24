contract TestTernaryValid {
    receive() {
        // Valid ternary expressions
        let a: Int = true ? 10 : 20;               // should be 10
        let b: Int = false ? 10 : 20;              // should be 20
        let c: Int = false ? 1 : false ? 2 : 3;     // right associative: equivalent to false ? 1 : (false ? 2 : 3), should be 3
    }
}
