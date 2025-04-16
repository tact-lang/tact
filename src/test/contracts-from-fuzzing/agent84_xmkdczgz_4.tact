contract TestUnaryOperators {
    receive() {
        let a: Int = -(-1);      // should be 1
        let b: Int = 5 + -5;       // should be 0
        dump(a);
        dump(b);
    }
}
