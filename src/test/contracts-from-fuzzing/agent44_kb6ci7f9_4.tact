contract TestBinaryArithmetic {
    receive() {
        // Basic arithmetic binary expressions
        let sum: Int = 1 + 2;         // Expect 3
        let product: Int = 2 * 3;       // Expect 6
        // Operator precedence: multiplication has higher precedence than addition
        let mix: Int = 1 + 2 * 3;       // Expect 7
        // Parenthesized expression to override precedence
        let mixPar: Int = (1 + 2) * 3;  // Expect 9
        dump(sum);
        dump(product);
        dump(mix);
        dump(mixPar);
    }
}
