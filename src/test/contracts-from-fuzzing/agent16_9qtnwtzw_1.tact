contract Test {
    receive() {
        // Testing arithmetic operator precedence based on documentation
        // According to documentation, multiplication has higher precedence than addition 
        let result: Int = 1 + 2 * 3; // Expected: 1 + (2*3) = 7
        // Dump the result for runtime verification
        // (In actual Tact code, a logging or output function would be used; assuming dump() here for demonstration)
        dump(result);
    }
}
