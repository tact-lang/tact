contract TestUnaryOperators {
    receive() {
        // Testing unary negation
        let neg: Int = -(-1); // Expect 1
        // Testing logical inversion
        let inv: Bool = !true; // Expect false
        // Testing bitwise not
        let bwNot: Int = ~(0); // Expect -1

        dump(neg);
        dump(inv);
        dump(bwNot);
    }
}
