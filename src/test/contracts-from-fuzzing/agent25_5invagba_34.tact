contract TestUnaryPrecedence2 {
    receive() {
        // Test operator precedence with unary minus and bitwise NOT
        // ~42 evaluates to -43, then -(-43) yields 43
        let v: Int = -~42;
        dump(v); // expected output: 43
    }
}
