contract TestUnaryOperators {
    receive() {
        // Test unary minus for Int
        let a: Int = -42;
        // Test double unary minus
        let b: Int = -(-42);

        // Test boolean inversion
        let c: Bool = !true;
        // Test double boolean inversion
        let d: Bool = !(!false);

        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}
