contract TestUnaryOperators {
    receive() {
        // Unary minus for integers
        let a: Int = -42;
        let b: Int = -(-42);
        // Logical NOT for booleans is usually !, if supported
        // However, if Tact follows standard operator rules, use !
        let c: Bool = !true;
        let d: Bool = !false;

        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}
