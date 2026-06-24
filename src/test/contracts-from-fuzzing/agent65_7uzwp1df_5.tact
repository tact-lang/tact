contract UnaryExprTest {
    receive() {
        // Unary minus operator
        let a: Int = -42;
        // Logical inversion operator
        let b: Bool = !true;
        // Bitwise NOT operator
        let c: Int = ~42;
        // Double negation should restore the value
        let d: Int = -(-42);
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}
