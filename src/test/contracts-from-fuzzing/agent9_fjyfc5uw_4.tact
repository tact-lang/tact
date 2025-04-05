contract TestUnaryMinus {
    receive() {
        // Test unary minus operator
        let a: Int = 5;
        let b: Int = -a;      // negation operator
        let c: Int = -(-a);   // double negation
        dump(b);             // expected output: -5
        dump(c);             // expected output: 5
    }
}
