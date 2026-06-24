contract TestTernaryChain {
    receive() {
        // Ternary operation chaining with right associativity
        // According to documentation, the alternative (after colon) is right associative
        // This should compile and assign a = 2, b = 3
        let a: Int = false ? 1 : true ? 2 : 3;
        let b: Int = false ? 1 : (false ? 2 : 3);
    }
}
