contract TestComplexPrecedence {
    receive() {
        // Evaluate complex ternary operator with mixed precedence. 
        // Expression: false ? 1 : true ? 2 + 3 : 4 * 5
        // Expected: since the condition is false, the alternative is evaluated: true ? 2 + 3 : 4 * 5
        // That inner ternary yields: since condition is true, result is 2+3 = 5.
        let x: Int = false ? 1 : true ? 2 + 3 : 4 * 5;
        dump(x);
    }
}
