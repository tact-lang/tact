contract TestUnaryNegation {
    receive() {
        let a: Int = -(-42);
        let b: Int = -42;
        let c: Int = -(a + b);
    }
}
